# README

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
Ruby 2.6.2

* System dependencies
  * development: SQLite3
  * production: PostgreSQL 11

* Database creation
  ```shell
  $ heroku run rails db:migrate
  ```

* Database initialization
  ```shell
  $ heroku run rails c
  irb(main):002:0> User.new(name: 'your name', email: 'sample@example.com', password: 'password', password_confirmation: 'password', admin: true).save
  ```

* How to run the test suite
  ```shell
  $ bundle exec rspec
  ```
