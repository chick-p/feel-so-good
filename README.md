# README

[![CircleCI](https://circleci.com/gh/chick-p/feel-so-good/tree/master.svg?style=shield)](https://circleci.com/gh/chick-p/feel-so-good/tree/master)
[![Coverage Status](https://coveralls.io/repos/github/chick-p/feel-so-good/badge.svg?branch=master&service=github)](https://coveralls.io/github/chick-p/feel-so-good?branch=master)

This application is an application which can register your feeling.

You record the followings:

* date
* score point (point is from -5 to 5 )
* the reason for giving the score
* the cause

This application runs on a heroku server.

```shell
$ heroku create APP_NAME
$ git push heroku master
```

Things you may want to cover:

* Ruby version
Ruby 2.6.5

* System dependencies
  * development: SQLite3
  * production: PostgreSQL 11

* Database creation
  ```shell
  $ heroku run rails db:migrate
  ```

* Enviroment variables
    * if login using twitter account.
        ```shell
        $ heroku config:set TWITTER_ENABLED=true
        $ heroku config:set TWITTER_KEY=[YOUR_TWITTER_API_KEY]
        $ heroku config:set TWITTER_SECRET=[YOUR_TWITTER_API_SECRET]
        ```

* Database initialization
  ```shell
  $ heroku run rails c
  irb(main):002:0> User.new(name: 'your name', email: 'sample@example.com', password: 'password', admin: true).save
  ```

* How to run the test suite
  ```shell
  $ bundle exec rspec
  ```

* How to set timezone
  ```shell
  # If your timezone is Asia/Tokyo
  $ heroku config:add TZ=Asia/Tokyo
  ```
