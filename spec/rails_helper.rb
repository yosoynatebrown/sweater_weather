# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
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

def coordinate_data
  {:lat=>39.738453, :lng=>-104.984853}
end

def forecast_data
  {:current_weather=>
  {:dt=>1642281403,
   :sunrise=>1642256344,
   :sunset=>1642291158,
   :temp=>46.6,
   :feels_like=>44.94,
   :pressure=>1024,
   :humidity=>44,
   :dew_point=>26.58,
   :uvi=>1.35,
   :clouds=>0,
   :visibility=>10000,
   :wind_speed=>4,
   :wind_deg=>176,
   :wind_gust=>8.01,
   :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]},
 :hourly_weather=>
  [{:dt=>1642280400,
    :temp=>46.6,
    :feels_like=>45.7,
    :pressure=>1024,
    :humidity=>44,
    :dew_point=>26.58,
    :uvi=>1.35,
    :clouds=>0,
    :visibility=>10000,
    :wind_speed=>3.13,
    :wind_deg=>160,
    :wind_gust=>5.3,
    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}],
    :pop=>0},
   {:dt=>1642284000,
    :temp=>45.3,
    :feels_like=>45.3,
    :pressure=>1023,
    :humidity=>45,
    :dew_point=>26.01,
    :uvi=>0.64,
    :clouds=>0,
    :visibility=>10000,
    :wind_speed=>2.8,
    :wind_deg=>171,
    :wind_gust=>2.89,
    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}],
    :pop=>0},
   {:dt=>1642287600,
    :temp=>43.45,
    :feels_like=>41.58,
    :pressure=>1022,
    :humidity=>47,
    :dew_point=>25.43,
    :uvi=>0.19,
    :clouds=>0,
    :visibility=>10000,
    :wind_speed=>3.69,
    :wind_deg=>189,
    :wind_gust=>3.42,
    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}],
    :pop=>0},
   {:dt=>1642291200,
    :temp=>40.53,
    :feels_like=>37.26,
    :pressure=>1021,
    :humidity=>53,
    :dew_point=>25.59,
    :uvi=>0,
    :clouds=>0,
    :visibility=>10000,
    :wind_speed=>4.79,
    :wind_deg=>211,
    :wind_gust=>4.43,
    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}],
    :pop=>0},
   {:dt=>1642294800,
    :temp=>37.94,
    :feels_like=>33.84,
    :pressure=>1020,
    :humidity=>59,
    :dew_point=>25.72,
    :uvi=>0,
    :clouds=>42,
    :visibility=>10000,
    :wind_speed=>5.28,
    :wind_deg=>228,
    :wind_gust=>4.97,
    :weather=>[{:id=>802, :main=>"Clouds", :description=>"scattered clouds", :icon=>"03n"}],
    :pop=>0},
   {:dt=>1642298400,
    :temp=>35.08,
    :feels_like=>30.61,
    :pressure=>1020,
    :humidity=>63,
    :dew_point=>23.61,
    :uvi=>0,
    :clouds=>26,
    :visibility=>10000,
    :wind_speed=>5.1,
    :wind_deg=>227,
    :wind_gust=>4.68,
    :weather=>[{:id=>802, :main=>"Clouds", :description=>"scattered clouds", :icon=>"03n"}],
    :pop=>0},
   {:dt=>1642302000,
    :temp=>34.41,
    :feels_like=>29.93,
    :pressure=>1020,
    :humidity=>59,
    :dew_point=>21.4,
    :uvi=>0,
    :clouds=>18,
    :visibility=>10000,
    :wind_speed=>4.97,
    :wind_deg=>235,
    :wind_gust=>4.72,
    :weather=>[{:id=>801, :main=>"Clouds", :description=>"few clouds", :icon=>"02n"}],
    :pop=>0},
   {:dt=>1642305600,
    :temp=>34.29,
    :feels_like=>29.52,
    :pressure=>1020,
    :humidity=>53,
    :dew_point=>18.72,
    :uvi=>0,
    :clouds=>15,
    :visibility=>10000,
    :wind_speed=>5.28,
    :wind_deg=>229,
    :wind_gust=>4.99,
    :weather=>[{:id=>801, :main=>"Clouds", :description=>"few clouds", :icon=>"02n"}],
    :pop=>0},
   {:dt=>1642309200,
    :temp=>34.72,
    :feels_like=>29.48,
    :pressure=>1019,
    :humidity=>51,
    :dew_point=>17.87,
    :uvi=>0,
    :clouds=>31,
    :visibility=>10000,
    :wind_speed=>5.97,
    :wind_deg=>209,
    :wind_gust=>6.15,
    :weather=>[{:id=>802, :main=>"Clouds", :description=>"scattered clouds", :icon=>"03n"}],
    :pop=>0},
   {:dt=>1642312800,
    :temp=>34.52,
    :feels_like=>29.05,
    :pressure=>1019,
    :humidity=>51,
    :dew_point=>17.91,
    :uvi=>0,
    :clouds=>42,
    :visibility=>10000,
    :wind_speed=>6.26,
    :wind_deg=>202,
    :wind_gust=>6.4,
    :weather=>[{:id=>802, :main=>"Clouds", :description=>"scattered clouds", :icon=>"03n"}],
    :pop=>0},
   {:dt=>1642316400,
    :temp=>34.84,
    :feels_like=>29.39,
    :pressure=>1019,
    :humidity=>51,
    :dew_point=>18.27,
    :uvi=>0,
    :clouds=>96,
    :visibility=>10000,
    :wind_speed=>6.31,
    :wind_deg=>206,
    :wind_gust=>6.73,
    :weather=>[{:id=>804, :main=>"Clouds", :description=>"overcast clouds", :icon=>"04n"}],
    :pop=>0},
   {:dt=>1642320000,
    :temp=>35.24,
    :feels_like=>29.77,
    :pressure=>1018,
    :humidity=>50,
    :dew_point=>18.1,
    :uvi=>0,
    :clouds=>87,
    :visibility=>10000,
    :wind_speed=>6.44,
    :wind_deg=>216,
    :wind_gust=>6.8,
    :weather=>[{:id=>804, :main=>"Clouds", :description=>"overcast clouds", :icon=>"04n"}],
    :pop=>0},
   {:dt=>1642323600,
    :temp=>35.78,
    :feels_like=>30.61,
    :pressure=>1017,
    :humidity=>48,
    :dew_point=>17.82,
    :uvi=>0,
    :clouds=>90,
    :visibility=>10000,
    :wind_speed=>6.17,
    :wind_deg=>218,
    :wind_gust=>6.51,
    :weather=>[{:id=>804, :main=>"Clouds", :description=>"overcast clouds", :icon=>"04n"}],
    :pop=>0},
   {:dt=>1642327200,
    :temp=>35.76,
    :feels_like=>31.17,
    :pressure=>1017,
    :humidity=>47,
    :dew_point=>17.33,
    :uvi=>0,
    :clouds=>92,
    :visibility=>10000,
    :wind_speed=>5.39,
    :wind_deg=>219,
    :wind_gust=>5.57,
    :weather=>[{:id=>804, :main=>"Clouds", :description=>"overcast clouds", :icon=>"04n"}],
    :pop=>0},
   {:dt=>1642330800,
    :temp=>35.17,
    :feels_like=>31.03,
    :pressure=>1017,
    :humidity=>47,
    :dew_point=>16.52,
    :uvi=>0,
    :clouds=>94,
    :visibility=>10000,
    :wind_speed=>4.74,
    :wind_deg=>220,
    :wind_gust=>4.56,
    :weather=>[{:id=>804, :main=>"Clouds", :description=>"overcast clouds", :icon=>"04n"}],
    :pop=>0},
   {:dt=>1642334400,
    :temp=>34.56,
    :feels_like=>31.62,
    :pressure=>1017,
    :humidity=>46,
    :dew_point=>15.69,
    :uvi=>0,
    :clouds=>79,
    :visibility=>10000,
    :wind_speed=>3.47,
    :wind_deg=>203,
    :wind_gust=>3.18,
    :weather=>[{:id=>803, :main=>"Clouds", :description=>"broken clouds", :icon=>"04n"}],
    :pop=>0},
   {:dt=>1642338000,
    :temp=>34.05,
    :feels_like=>29.26,
    :pressure=>1018,
    :humidity=>47,
    :dew_point=>15.64,
    :uvi=>0,
    :clouds=>6,
    :visibility=>10000,
    :wind_speed=>5.26,
    :wind_deg=>197,
    :wind_gust=>4.85,
    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}],
    :pop=>0},
   {:dt=>1642341600,
    :temp=>33.58,
    :feels_like=>28.65,
    :pressure=>1018,
    :humidity=>49,
    :dew_point=>16.32,
    :uvi=>0,
    :clouds=>6,
    :visibility=>10000,
    :wind_speed=>5.32,
    :wind_deg=>193,
    :wind_gust=>5.61,
    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}],
    :pop=>0},
   {:dt=>1642345200,
    :temp=>34.27,
    :feels_like=>28.98,
    :pressure=>1017,
    :humidity=>48,
    :dew_point=>16.5,
    :uvi=>0.2,
    :clouds=>4,
    :visibility=>10000,
    :wind_speed=>5.95,
    :wind_deg=>191,
    :wind_gust=>5.95,
    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}],
    :pop=>0},
   {:dt=>1642348800,
    :temp=>36.91,
    :feels_like=>33.1,
    :pressure=>1016,
    :humidity=>46,
    :dew_point=>17.71,
    :uvi=>0.65,
    :clouds=>3,
    :visibility=>10000,
    :wind_speed=>4.7,
    :wind_deg=>192,
    :wind_gust=>6.69,
    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}],
    :pop=>0},
   {:dt=>1642352400,
    :temp=>40.39,
    :feels_like=>37.98,
    :pressure=>1016,
    :humidity=>43,
    :dew_point=>19.11,
    :uvi=>1.34,
    :clouds=>2,
    :visibility=>10000,
    :wind_speed=>3.78,
    :wind_deg=>186,
    :wind_gust=>4.97,
    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}],
    :pop=>0},
   {:dt=>1642356000,
    :temp=>43.41,
    :feels_like=>43.41,
    :pressure=>1015,
    :humidity=>38,
    :dew_point=>19.13,
    :uvi=>1.95,
    :clouds=>2,
    :visibility=>10000,
    :wind_speed=>0.63,
    :wind_deg=>153,
    :wind_gust=>1.3,
    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}],
    :pop=>0},
   {:dt=>1642359600,
    :temp=>45.1,
    :feels_like=>45.1,
    :pressure=>1014,
    :humidity=>33,
    :dew_point=>17.4,
    :uvi=>2.19,
    :clouds=>0,
    :visibility=>10000,
    :wind_speed=>2.82,
    :wind_deg=>92,
    :wind_gust=>3.04,
    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}],
    :pop=>0},
   {:dt=>1642363200,
    :temp=>46.98,
    :feels_like=>44.2,
    :pressure=>1013,
    :humidity=>28,
    :dew_point=>14.68,
    :uvi=>1.95,
    :clouds=>0,
    :visibility=>10000,
    :wind_speed=>5.75,
    :wind_deg=>66,
    :wind_gust=>6.87,
    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}],
    :pop=>0},
   {:dt=>1642366800,
    :temp=>48.43,
    :feels_like=>47.07,
    :pressure=>1013,
    :humidity=>24,
    :dew_point=>12.92,
    :uvi=>1.34,
    :clouds=>0,
    :visibility=>10000,
    :wind_speed=>3.98,
    :wind_deg=>39,
    :wind_gust=>5.64,
    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}],
    :pop=>0},
   {:dt=>1642370400,
    :temp=>47.73,
    :feels_like=>45.39,
    :pressure=>1014,
    :humidity=>25,
    :dew_point=>13.1,
    :uvi=>0.65,
    :clouds=>0,
    :visibility=>10000,
    :wind_speed=>5.26,
    :wind_deg=>51,
    :wind_gust=>8.88,
    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}],
    :pop=>0},
   {:dt=>1642374000,
    :temp=>44.55,
    :feels_like=>41.41,
    :pressure=>1015,
    :humidity=>31,
    :dew_point=>15.49,
    :uvi=>0.19,
    :clouds=>0,
    :visibility=>10000,
    :wind_speed=>5.59,
    :wind_deg=>74,
    :wind_gust=>10.54,
    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}],
    :pop=>0},
   {:dt=>1642377600,
    :temp=>40.51,
    :feels_like=>36.23,
    :pressure=>1017,
    :humidity=>38,
    :dew_point=>16.93,
    :uvi=>0,
    :clouds=>1,
    :visibility=>10000,
    :wind_speed=>6.22,
    :wind_deg=>77,
    :wind_gust=>12.41,
    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}],
    :pop=>0},
   {:dt=>1642381200,
    :temp=>38.35,
    :feels_like=>35.17,
    :pressure=>1018,
    :humidity=>43,
    :dew_point=>17.55,
    :uvi=>0,
    :clouds=>0,
    :visibility=>10000,
    :wind_speed=>4.27,
    :wind_deg=>64,
    :wind_gust=>8.57,
    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}],
    :pop=>0},
   {:dt=>1642384800,
    :temp=>37.27,
    :feels_like=>37.27,
    :pressure=>1019,
    :humidity=>45,
    :dew_point=>17.56,
    :uvi=>0,
    :clouds=>3,
    :visibility=>10000,
    :wind_speed=>2.17,
    :wind_deg=>10,
    :wind_gust=>2.48,
    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}],
    :pop=>0},
   {:dt=>1642388400,
    :temp=>36.52,
    :feels_like=>36.52,
    :pressure=>1019,
    :humidity=>46,
    :dew_point=>17.49,
    :uvi=>0,
    :clouds=>3,
    :visibility=>10000,
    :wind_speed=>1.1,
    :wind_deg=>277,
    :wind_gust=>1.39,
    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}],
    :pop=>0},
   {:dt=>1642392000,
    :temp=>35.89,
    :feels_like=>35.89,
    :pressure=>1019,
    :humidity=>47,
    :dew_point=>17.53,
    :uvi=>0,
    :clouds=>4,
    :visibility=>10000,
    :wind_speed=>1.52,
    :wind_deg=>133,
    :wind_gust=>1.77,
    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}],
    :pop=>0},
   {:dt=>1642395600,
    :temp=>35.24,
    :feels_like=>35.24,
    :pressure=>1018,
    :humidity=>48,
    :dew_point=>17.28,
    :uvi=>0,
    :clouds=>4,
    :visibility=>10000,
    :wind_speed=>2.17,
    :wind_deg=>194,
    :wind_gust=>2.37,
    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}],
    :pop=>0},
   {:dt=>1642399200,
    :temp=>34.7,
    :feels_like=>34.7,
    :pressure=>1018,
    :humidity=>50,
    :dew_point=>17.47,
    :uvi=>0,
    :clouds=>3,
    :visibility=>10000,
    :wind_speed=>1.92,
    :wind_deg=>191,
    :wind_gust=>1.99,
    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}],
    :pop=>0},
   {:dt=>1642402800,
    :temp=>34.23,
    :feels_like=>34.23,
    :pressure=>1017,
    :humidity=>51,
    :dew_point=>17.38,
    :uvi=>0,
    :clouds=>1,
    :visibility=>10000,
    :wind_speed=>1.83,
    :wind_deg=>176,
    :wind_gust=>1.9,
    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}],
    :pop=>0},
   {:dt=>1642406400,
    :temp=>33.93,
    :feels_like=>33.93,
    :pressure=>1016,
    :humidity=>51,
    :dew_point=>17.44,
    :uvi=>0,
    :clouds=>0,
    :visibility=>10000,
    :wind_speed=>1.23,
    :wind_deg=>229,
    :wind_gust=>1.39,
    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}],
    :pop=>0},
   {:dt=>1642410000,
    :temp=>33.85,
    :feels_like=>33.85,
    :pressure=>1016,
    :humidity=>51,
    :dew_point=>17.4,
    :uvi=>0,
    :clouds=>2,
    :visibility=>10000,
    :wind_speed=>1.63,
    :wind_deg=>221,
    :wind_gust=>1.59,
    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}],
    :pop=>0},
   {:dt=>1642413600,
    :temp=>33.91,
    :feels_like=>31.21,
    :pressure=>1015,
    :humidity=>50,
    :dew_point=>17.2,
    :uvi=>0,
    :clouds=>3,
    :visibility=>10000,
    :wind_speed=>3.2,
    :wind_deg=>203,
    :wind_gust=>3.09,
    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}],
    :pop=>0},
   {:dt=>1642417200,
    :temp=>34.02,
    :feels_like=>34.02,
    :pressure=>1014,
    :humidity=>49,
    :dew_point=>16.79,
    :uvi=>0,
    :clouds=>4,
    :visibility=>10000,
    :wind_speed=>2.62,
    :wind_deg=>195,
    :wind_gust=>2.44,
    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}],
    :pop=>0},
   {:dt=>1642420800,
    :temp=>34.11,
    :feels_like=>34.11,
    :pressure=>1014,
    :humidity=>48,
    :dew_point=>16.21,
    :uvi=>0,
    :clouds=>4,
    :visibility=>10000,
    :wind_speed=>1.36,
    :wind_deg=>202,
    :wind_gust=>1.36,
    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}],
    :pop=>0},
   {:dt=>1642424400,
    :temp=>34.25,
    :feels_like=>34.25,
    :pressure=>1014,
    :humidity=>46,
    :dew_point=>15.62,
    :uvi=>0,
    :clouds=>6,
    :visibility=>10000,
    :wind_speed=>2.68,
    :wind_deg=>198,
    :wind_gust=>2.59,
    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}],
    :pop=>0},
   {:dt=>1642428000,
    :temp=>34.5,
    :feels_like=>30.7,
    :pressure=>1014,
    :humidity=>45,
    :dew_point=>15.33,
    :uvi=>0,
    :clouds=>7,
    :visibility=>10000,
    :wind_speed=>4.25,
    :wind_deg=>195,
    :wind_gust=>4.09,
    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}],
    :pop=>0},
   {:dt=>1642431600,
    :temp=>35.44,
    :feels_like=>31.64,
    :pressure=>1013,
    :humidity=>43,
    :dew_point=>15.13,
    :uvi=>0.2,
    :clouds=>16,
    :visibility=>10000,
    :wind_speed=>4.41,
    :wind_deg=>202,
    :wind_gust=>4.18,
    :weather=>[{:id=>801, :main=>"Clouds", :description=>"few clouds", :icon=>"02d"}],
    :pop=>0},
   {:dt=>1642435200,
    :temp=>38.26,
    :feels_like=>34.79,
    :pressure=>1013,
    :humidity=>39,
    :dew_point=>15.39,
    :uvi=>0.68,
    :clouds=>16,
    :visibility=>10000,
    :wind_speed=>4.56,
    :wind_deg=>200,
    :wind_gust=>4.81,
    :weather=>[{:id=>801, :main=>"Clouds", :description=>"few clouds", :icon=>"02d"}],
    :pop=>0},
   {:dt=>1642438800,
    :temp=>41.7,
    :feels_like=>39,
    :pressure=>1012,
    :humidity=>35,
    :dew_point=>15.93,
    :uvi=>1.38,
    :clouds=>14,
    :visibility=>10000,
    :wind_speed=>4.32,
    :wind_deg=>195,
    :wind_gust=>5.3,
    :weather=>[{:id=>801, :main=>"Clouds", :description=>"few clouds", :icon=>"02d"}],
    :pop=>0},
   {:dt=>1642442400,
    :temp=>45.39,
    :feels_like=>44.01,
    :pressure=>1010,
    :humidity=>32,
    :dew_point=>16.57,
    :uvi=>2.01,
    :clouds=>12,
    :visibility=>10000,
    :wind_speed=>3.47,
    :wind_deg=>184,
    :wind_gust=>4.59,
    :weather=>[{:id=>801, :main=>"Clouds", :description=>"few clouds", :icon=>"02d"}],
    :pop=>0},
   {:dt=>1642446000,
    :temp=>48.63,
    :feels_like=>48.63,
    :pressure=>1009,
    :humidity=>28,
    :dew_point=>16.48,
    :uvi=>2.26,
    :clouds=>0,
    :visibility=>10000,
    :wind_speed=>2.15,
    :wind_deg=>175,
    :wind_gust=>2.95,
    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}],
    :pop=>0},
   {:dt=>1642449600,
    :temp=>50.92,
    :feels_like=>46.89,
    :pressure=>1008,
    :humidity=>25,
    :dew_point=>16.02,
    :uvi=>2.01,
    :clouds=>3,
    :visibility=>10000,
    :wind_speed=>1.01,
    :wind_deg=>163,
    :wind_gust=>2.01,
    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}],
    :pop=>0}],
 :daily_weather=>
  [{:dt=>1642273200,
    :sunrise=>1642256344,
    :sunset=>1642291158,
    :moonrise=>1642283760,
    :moonset=>1642250820,
    :moon_phase=>0.43,
    :temp=>{:day=>43.11, :min=>25.16, :max=>46.6, :night=>34.52, :eve=>37.94, :morn=>25.92},
    :feels_like=>{:day=>39.83, :night=>29.05, :eve=>33.84, :morn=>19.24},
    :pressure=>1024,
    :humidity=>43,
    :dew_point=>23.27,
    :wind_speed=>6.71,
    :wind_deg=>175,
    :wind_gust=>13.6,
    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}],
    :clouds=>0,
    :pop=>0.08,
    :uvi=>2.21},
   {:dt=>1642359600,
    :sunrise=>1642342720,
    :sunset=>1642377624,
    :moonrise=>1642373220,
    :moonset=>1642340400,
    :moon_phase=>0.46,
    :temp=>{:day=>45.1, :min=>33.58, :max=>48.43, :night=>34.7, :eve=>38.35, :morn=>34.05},
    :feels_like=>{:day=>45.1, :night=>34.7, :eve=>35.17, :morn=>29.26},
    :pressure=>1014,
    :humidity=>33,
    :dew_point=>17.4,
    :wind_speed=>6.44,
    :wind_deg=>216,
    :wind_gust=>12.41,
    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}],
    :clouds=>0,
    :pop=>0,
    :uvi=>2.19},
   {:dt=>1642446000,
    :sunrise=>1642429094,
    :sunset=>1642464090,
    :moonrise=>1642463040,
    :moonset=>1642429620,
    :moon_phase=>0.5,
    :temp=>{:day=>48.63, :min=>33.85, :max=>52.02, :night=>40.93, :eve=>45.93, :morn=>34.25},
    :feels_like=>{:day=>48.63, :night=>37.89, :eve=>45.93, :morn=>34.25},
    :pressure=>1009,
    :humidity=>28,
    :dew_point=>16.48,
    :wind_speed=>4.59,
    :wind_deg=>213,
    :wind_gust=>5.3,
    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}],
    :clouds=>0,
    :pop=>0,
    :uvi=>2.26},
   {:dt=>1642532400,
    :sunrise=>1642515466,
    :sunset=>1642550558,
    :moonrise=>1642553160,
    :moonset=>1642518480,
    :moon_phase=>0.52,
    :temp=>{:day=>45.36, :min=>37, :max=>50.18, :night=>37, :eve=>46.24, :morn=>38.91},
    :feels_like=>{:day=>45.36, :night=>31.75, :eve=>44.69, :morn=>37.06},
    :pressure=>1009,
    :humidity=>26,
    :dew_point=>12.06,
    :wind_speed=>6.64,
    :wind_deg=>70,
    :wind_gust=>9.73,
    :weather=>[{:id=>804, :main=>"Clouds", :description=>"overcast clouds", :icon=>"04d"}],
    :clouds=>99,
    :pop=>0,
    :uvi=>1.78},
   {:dt=>1642618800,
    :sunrise=>1642601835,
    :sunset=>1642637026,
    :moonrise=>1642643340,
    :moonset=>1642606980,
    :moon_phase=>0.56,
    :temp=>{:day=>34.72, :min=>30.29, :max=>39.11, :night=>31.78, :eve=>38.61, :morn=>30.88},
    :feels_like=>{:day=>30.47, :night=>31.78, :eve=>38.61, :morn=>25.99},
    :pressure=>1024,
    :humidity=>55,
    :dew_point=>20.05,
    :wind_speed=>6.08,
    :wind_deg=>107,
    :wind_gust=>7.67,
    :weather=>[{:id=>802, :main=>"Clouds", :description=>"scattered clouds", :icon=>"03d"}],
    :clouds=>50,
    :pop=>0,
    :uvi=>2.04},
   {:dt=>1642705200,
    :sunrise=>1642688203,
    :sunset=>1642723494,
    :moonrise=>1642733640,
    :moonset=>1642695240,
    :moon_phase=>0.59,
    :temp=>{:day=>38.55, :min=>30.81, :max=>43.9, :night=>36.12, :eve=>41.9, :morn=>30.81},
    :feels_like=>{:day=>38.55, :night=>33.66, :eve=>38.03, :morn=>30.81},
    :pressure=>1023,
    :humidity=>47,
    :dew_point=>19.54,
    :wind_speed=>6.69,
    :wind_deg=>146,
    :wind_gust=>13.65,
    :weather=>[{:id=>801, :main=>"Clouds", :description=>"few clouds", :icon=>"02d"}],
    :clouds=>18,
    :pop=>0,
    :uvi=>3},
   {:dt=>1642791600,
    :sunrise=>1642774569,
    :sunset=>1642809963,
    :moonrise=>1642823940,
    :moonset=>1642783260,
    :moon_phase=>0.62,
    :temp=>{:day=>47.52, :min=>34.34, :max=>50.97, :night=>36.45, :eve=>43.93, :morn=>34.34},
    :feels_like=>{:day=>44.04, :night=>32.7, :eve=>37.89, :morn=>34.34},
    :pressure=>1016,
    :humidity=>25,
    :dew_point=>13.17,
    :wind_speed=>11.7,
    :wind_deg=>72,
    :wind_gust=>16.51,
    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}],
    :clouds=>6,
    :pop=>0,
    :uvi=>3},
   {:dt=>1642878000,
    :sunrise=>1642860933,
    :sunset=>1642896433,
    :moonrise=>1642914180,
    :moonset=>1642871160,
    :moon_phase=>0.65,
    :temp=>{:day=>43.32, :min=>33.71, :max=>48.65, :night=>39.61, :eve=>45.93, :morn=>33.71},
    :feels_like=>{:day=>43.32, :night=>36.19, :eve=>45.93, :morn=>31.01},
    :pressure=>1024,
    :humidity=>21,
    :dew_point=>6.12,
    :wind_speed=>6.02,
    :wind_deg=>214,
    :wind_gust=>7.56,
    :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}],
    :clouds=>3,
    :pop=>0,
    :uvi=>3}]}
end