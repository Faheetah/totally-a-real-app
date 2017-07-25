Quick app thrown together from the Resque, Sinatra, and Sequel projects to demonstrate a multi-tiered app and to use as a test app for automation deployments.

To deploy:

* Install rbenv, Ruby 2.4.1, and bundler
* Install either sqlite or Postgres somewhere, point config.yml to it
* Install Redis somewhere and point config.yml to it
* Start Resque with `rake resque:work`
* Start the scheduler with `rake resque:scheduler`
* Start Sinatra with `ruby app.rb`
* Watch the magic happen