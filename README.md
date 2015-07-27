# Movierama example app

An app for social sharing of movie recommendations.

## Dependencies

1. Postgresql

## Getting started

Run 
1. `scripts/bootstrap.sh`
2. `rvm reload`
3. `bundle install`
4. `sudo -u postgres createuser movierama-app --createdb`
5. `rake db:create`
6. `rake db:migrate`

## Running on Heroku

instructions go here.
