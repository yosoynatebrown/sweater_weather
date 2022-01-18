# README
This project is a project for the Turing School involving the consumption of the OpenWeather, MapQuest, and Unsplash APIs. The learning goals include:

* Expose an API that aggregates data from multiple external APIs
* Expose an API that requires an authentication token
* Expose an API for CRUD functionality
* Determine completion criteria based on the needs of other developers
* Research, select, and consume an API based on your needs as a developer


For more context, see the project page [here.](https://backend.turing.edu/module3/projects/sweater_weather/)


To clone down this repo, run the following on your terminal:

`git clone git@github.com:yosoynatebrown/sweater_weather.git`

Then run:\
`rails db:{create,migrate}`\
`bundle install`\
and\
`bundle exec figaro install`
to create an application.yml file in your config directory (where you will you store the necessary API keys).

Register for a MapQuest API key [here.](https://developer.mapquest.com/plan_purchase/steps/business_edition/business_edition_free/register)\
Register for a Unsplash API key [here.](https://unsplash.com/developers)\
Register for a OpenWeather API key [here.](https://home.openweathermap.org/users/sign_up)

Place those keys in your application.yml file like so:

```
mapquest_key: <API KEY>
open_weather_key: <API KEY>
unsplash_key: <API KEY>
```

## Endpoints

### Retrieve weather for a city
#### Request:
```
GET /api/v1/forecast?location=Denver,CO
Content-Type: application/json
Accept: application/json
```
#### Response:
```
{
  "data": {
    "id": null,
    "type": "forecast",
    "attributes": {
      "current_weather": {
        "datetime": "2020-09-30 13:27:03 -0600",
        "temperature": 79.4,
        etc
      },
      "daily_weather": [
        {
          "date": "2020-10-01",
          "sunrise": "2020-10-01 06:10:43 -0600",
          etc
        },
        {...} etc
      ],
      "hourly_weather": [
        {
          "time": "14:00:00",
          "conditions": "cloudy with a chance of meatballs",
          etc
        },
        {...} etc
      ]
    }
  }
}
```
### Background Image for the City

#### Request:
```
GET /api/v1/backgrounds?location=Denver,CO
Content-Type: application/json
Accept: application/json
```

#### Response:

This will return the url of an appropriate background image for a location:
```
status: 200
body:
{
  "data": {
    "type": "image",
    "id": null,
    "attributes": {
      "image": {
        "location": "denver,co",
        "image_url": "https://pixabay.com/get/54e6d4444f50a814f1dc8460962930761c38d6ed534c704c7c2878dd954dc451_640.jpg",
        "credit": {
          "source": "pixabay.com",
          "author": "quinntheislander",
          "logo": "https://pixabay.com/static/img/logo_square.png"
        }
      }
    }
  }
}
```
### User Registration

#### Request:
```
POST /api/v1/users
Content-Type: application/json
Accept: application/json

{
  "email": "whatever@example.com",
  "password": "password",
  "password_confirmation": "password"
}
```
#### Response:
```
status: 201
body:

{
  "data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": <user api key>
    }
  }
}
```
### Login:

#### Request:
```
POST /api/v1/sessions
Content-Type: application/json
Accept: application/json

{
  "email": "whatever@example.com",
  "password": "password"
}
```
#### Response:
```
status: 200
body:
{
  "data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": <user api key>
    }
  }
}
```
### Road Trip
This endpoint helps logged in users plan a road trip by giving them a travel time estimate and weather at the time/location of their arrival.
#### Request:
```
POST /api/v1/road_trip
Content-Type: application/json
Accept: application/json

body:

{
  "origin": "Denver,CO",
  "destination": "Pueblo,CO",
  "api_key": <user api key>
}
```

#### Response:
```
{
  "data": {
    "id": null,
    "type": "roadtrip",
    "attributes": {
      "start_city": "Denver, CO",
      "end_city": "Estes Park, CO",
      "travel_time": "2 hours, 13 minutes"
      "weather_at_eta": {
        "temperature": 59.4,
        "conditions": "partly cloudy with a chance of meatballs"
      }
    }
  }
}
```
