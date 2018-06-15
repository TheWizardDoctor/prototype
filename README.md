# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

rails generate scaffold Roadmap name:string description:text --force
rails generate scaffold Initiative name:string description:text roadmap:belongs_to --force
rails generate scaffold Feature name:string description:text initiative:belongs_to --force
rails generate scaffold Team name:string description:text feature:belongs_to --force
rails generate scaffold Quater name:string --force
