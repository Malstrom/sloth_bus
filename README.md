# README

* Ruby/Rails version

        ruby-3.0.0
        rails 7.0.3

* Configuration

    You need to configure your config/database.yml before create db and migrations.
    I simply add password to default configuration.

* Database creation

        rails db:create

* Database initialization

        rails db:migrate

* How to run the test suite

    tests are not implemented

* Services (job queues, cache servers, search engines, etc.)

    Maybe i will create a background job for create automatically trips like:
    
        Location.all.permutation(2).each do |pair_of_location|

* Deployment instructions

    To run locally application simply
        
        rails s

