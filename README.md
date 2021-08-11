# Sweater Weather

## Setup

* Fork and clone this repo
* `$ bundle install`
* `$ bundle exec figaro install`
* [Mapquest Geocoding API](https://developer.mapquest.com/)
* [OpenWeather One Call API key](https://openweathermap.org/api)

#### Versions
* Ruby verion: 2.7.2
* Rails version: 5.2.5

## Overview
Sweater Weather is a project to consume and expose internal and external APIs. It's main function is to provide a Front End application weather and travel data fir a hypothetical road trip.

Primary Learning goals:
* Expose an API that aggregates data from multiple external APIs
* Expose an API that requires an authentication token
* Expose an API for CRUD functionality
* Determine completion criteria based on the needs of other developers
* Research, select, and consume an API based on your needs as a developer

## Endpoints

### Retrieve weather for a city

''''
GET /api/v1/forecast?location=denver,co
Content-Type: application/json
Accept: application/json
''''

### Background Image for the City

''''
GET /api/v1/backgrounds?location=denver,co
Content-Type: application/json
Accept: application/json
''''

### User Registration

''''
POST /api/v1/users
Content-Type: application/json
Accept: application/json

{
  "email": "whatever@example.com",
  "password": "password",
  "password_confirmation": "password"
}
''''

#### Login

''''
POST /api/v1/sessions
Content-Type: application/json
Accept: application/json

{
  "email": "whatever@example.com",
  "password": "password"
}
''''

#### Road Trip

''''
POST /api/v1/road_trip
Content-Type: application/json
Accept: application/json

body:

{
  "origin": "Denver,CO",
  "destination": "Pueblo,CO",
  "api_key": "jgn983hy48thw9begh98h4539h4"
} 
''''
