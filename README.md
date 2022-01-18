# README
This project is a project for the Turing School involving the consumption of the OpenWeather, MapQuest, and Unsplash APIs. The learning goals include:

* Expose an API that aggregates data from multiple external APIs
* Expose an API that requires an authentication token
* Expose an API for CRUD functionality
* Determine completion criteria based on the needs of other developers
* Research, select, and consume an API based on your needs as a developer


To clone down this repo, run the following on your terminal:

`git clone git@github.com:yosoynatebrown/sweater_weather.git`

Then run:
'rails db:{create,migrate}`
`bundle install`
and
`bundle exec figaro install`
to create an application.yml file in your config directory (where you will you store the necessary API keys).

Register for a MapQuest API key [here.](https://developer.mapquest.com/plan_purchase/steps/business_edition/business_edition_free/register)
Register for a Unsplash API key [here.](https://unsplash.com/developers)
Register for a OpenWeather API key [here.](https://home.openweathermap.org/users/sign_up)

Place those keys in your application.yml file like so:

```
mapquest_key: <API KEY>
open_weather_key: <API KEY>
unsplash_key: <API KEY>
```
