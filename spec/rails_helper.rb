# frozen_string_literal: true

# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'
require 'simplecov'
SimpleCov.start
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.include FactoryBot::Syntax::Methods
  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock
  config.filter_sensitive_data('<mapquest_key>') { ENV['mapquest_key'] }
  config.filter_sensitive_data('<open_weather_key>') { ENV['open_weather_key'] }
  config.filter_sensitive_data('<unsplash_key>') { ENV['unsplash_key'] }
  config.default_cassette_options = { re_record_interval: 1.hour }
  config.configure_rspec_metadata!
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

def coordinate_data
  { lat: 39.738453, lng: -104.984853 }
end

def forecast_data
  { current_weather: { dt: 1_642_281_403,
                       sunrise: 1_642_256_344,
                       sunset: 1_642_291_158,
                       temp: 46.6,
                       feels_like: 44.94,
                       pressure: 1024,
                       humidity: 44,
                       dew_point: 26.58,
                       uvi: 1.35,
                       clouds: 0,
                       visibility: 10_000,
                       wind_speed: 4,
                       wind_deg: 176,
                       wind_gust: 8.01,
                       weather: [{ id: 800, main: 'Clear', description: 'clear sky', icon: '01d' }] },
    hourly_weather: [{ dt: 1_642_280_400,
                       temp: 46.6,
                       feels_like: 45.7,
                       pressure: 1024,
                       humidity: 44,
                       dew_point: 26.58,
                       uvi: 1.35,
                       clouds: 0,
                       visibility: 10_000,
                       wind_speed: 3.13,
                       wind_deg: 160,
                       wind_gust: 5.3,
                       weather: [{ id: 800, main: 'Clear', description: 'clear sky', icon: '01d' }],
                       pop: 0 }],
    daily_weather: [{ dt: 1_642_273_200,
                      sunrise: 1_642_256_344,
                      sunset: 1_642_291_158,
                      moonrise: 1_642_283_760,
                      moonset: 1_642_250_820,
                      moon_phase: 0.43,
                      temp: { day: 43.11, min: 25.16, max: 46.6, night: 34.52, eve: 37.94, morn: 25.92 },
                      feels_like: { day: 39.83, night: 29.05, eve: 33.84, morn: 19.24 },
                      pressure: 1024,
                      humidity: 43,
                      dew_point: 23.27,
                      wind_speed: 6.71,
                      wind_deg: 175,
                      wind_gust: 13.6,
                      weather: [{ id: 800, main: 'Clear', description: 'clear sky', icon: '01d' }],
                      clouds: 0,
                      pop: 0.08,
                      uvi: 2.21 }] }
end

def directions_data
  { hasTollRoad: false,
    hasBridge: false,
    boundingBox: { lr: { lng: -104.983597, lat: 34.052738 },
                   ul: { lng: -118.24437, lat: 39.738441 } },
    distance: 1018.2281,
    hasTimedRestriction: false,
    hasTunnel: true,
    hasHighway: true,
    computedWaypoints: [],
    routeError: { errorCode: -400, message: '' },
    formattedTime: '14:58:56',
    }
end

def image_data
  { id: 'mvtrRdFDzzI',
    created_at: '2021-10-17T17:49:50-04:00',
    updated_at: '2022-01-15T06:22:49-05:00',
    promoted_at: nil,
    width: 4160,
    height: 5200,
    color: '#f3f3f3',
    blur_hash: 'LxG[yYIAIUjZ~qIUM{WB%gM{R%WB',
    description: 'Community in Denver.',
    alt_description: nil,
    urls: { raw: 'https://images.unsplash.com/photo-1634507307799-ace9b49840b7?ixid=MnwyOTE0ODd8MHwxfHNlYXJjaHwxfHxEZW52ZXIlMkMlMjBDT3xlbnwwfHx8fDE2NDIyODg5Mzk&ixlib=rb-1.2.1',
            full: 'https://images.unsplash.com/photo-1634507307799-ace9b49840b7?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyOTE0ODd8MHwxfHNlYXJjaHwxfHxEZW52ZXIlMkMlMjBDT3xlbnwwfHx8fDE2NDIyODg5Mzk&ixlib=rb-1.2.1&q=85',
            regular: 'https://images.unsplash.com/photo-1634507307799-ace9b49840b7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyOTE0ODd8MHwxfHNlYXJjaHwxfHxEZW52ZXIlMkMlMjBDT3xlbnwwfHx8fDE2NDIyODg5Mzk&ixlib=rb-1.2.1&q=80&w=1080',
            small: 'https://images.unsplash.com/photo-1634507307799-ace9b49840b7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyOTE0ODd8MHwxfHNlYXJjaHwxfHxEZW52ZXIlMkMlMjBDT3xlbnwwfHx8fDE2NDIyODg5Mzk&ixlib=rb-1.2.1&q=80&w=400',
            thumb: 'https://images.unsplash.com/photo-1634507307799-ace9b49840b7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyOTE0ODd8MHwxfHNlYXJjaHwxfHxEZW52ZXIlMkMlMjBDT3xlbnwwfHx8fDE2NDIyODg5Mzk&ixlib=rb-1.2.1&q=80&w=200' },
    links: { self: 'https://api.unsplash.com/photos/mvtrRdFDzzI',
             html: 'https://unsplash.com/photos/mvtrRdFDzzI',
             download: 'https://unsplash.com/photos/mvtrRdFDzzI/download?ixid=MnwyOTE0ODd8MHwxfHNlYXJjaHwxfHxEZW52ZXIlMkMlMjBDT3xlbnwwfHx8fDE2NDIyODg5Mzk',
             download_location: 'https://api.unsplash.com/photos/mvtrRdFDzzI/download?ixid=MnwyOTE0ODd8MHwxfHNlYXJjaHwxfHxEZW52ZXIlMkMlMjBDT3xlbnwwfHx8fDE2NDIyODg5Mzk' },
    categories: [],
    likes: 2,
    liked_by_user: false,
    current_user_collections: [],
    sponsorship: nil,
    topic_submissions: { "current-events": { status: 'rejected' } },
    user: { id: '6fM0nTrpvTI',
            updated_at: '2022-01-15T17:56:36-05:00',
            username: 'dillydallying',
            name: 'Dillon Wanner',
            first_name: 'Dillon',
            last_name: 'Wanner',
            twitter_username: nil,
            portfolio_url: 'https://dillydally.myportfolio.com',
            bio: "Artist, Photographer, cinematographer living in Denver, Co. \r\nMy photos are a small glimpse of what I’m feeling or that perspective at that time. Trying to communicate that with other humans. I love you.",
            location: 'Denver Colorado',
            links: { self: 'https://api.unsplash.com/users/dillydallying',
                     html: 'https://unsplash.com/@dillydallying',
                     photos: 'https://api.unsplash.com/users/dillydallying/photos',
                     likes: 'https://api.unsplash.com/users/dillydallying/likes',
                     portfolio: 'https://api.unsplash.com/users/dillydallying/portfolio',
                     following: 'https://api.unsplash.com/users/dillydallying/following',
                     followers: 'https://api.unsplash.com/users/dillydallying/followers' },
            profile_image: { small: 'https://images.unsplash.com/profile-1616266477156-e4cd50197e4dimage?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32',
                             medium: 'https://images.unsplash.com/profile-1616266477156-e4cd50197e4dimage?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64',
                             large: 'https://images.unsplash.com/profile-1616266477156-e4cd50197e4dimage?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128' },
            instagram_username: 'Dillydally.ing',
            total_collections: 0,
            total_likes: 52,
            total_photos: 242,
            accepted_tos: true,
            for_hire: true,
            social: { instagram_username: 'Dillydally.ing', portfolio_url: 'https://dillydally.myportfolio.com',
                      twitter_username: nil, paypal_email: nil } },
    tags: [{ type: 'search', title: 'denver' }, { type: 'search', title: 'co' },
           { type: 'search', title: 'usa' }] }
end
