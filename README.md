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




Execute project

  Setup project (bundle, create db for different enviroments, migration)

  Run Project ( rails s for local environment )

  Go to home page.

  Click on Get Data button to fetching record from ecb website and save data in database.

  Goto console to exchange any amount of euros for the period  (rails c)
  fire command : 
          
          Currency.exchange(100,[Date.today + 1.day])
          Currency.exchange(100,[Date.yesterday, Date.today, Date.today - 3.day])




  For Testing goto to terminal (data required to test)
  fire command :

          rspec spec    ( to test all test cases )


