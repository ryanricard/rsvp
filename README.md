## Rsvp

Nerds do find love. Rsvp is a Rails mountable engine that enables a wrapping application to collection online RSVP responses.

### Installing Rsvp

Add Rsvp to your Gemfile and then bundle:

`gem 'rsvp' '~> 0.0.1'`

Migrate your database:

`rake db:migrate`

### Altering Rsvp views

To alter Rsvp standard views, run the following generator:

`rails generate rsvp:views`

Copies of Rsvp's standard views will be copied to `app/views/rsvp/.`

### Contribute

Fork, branch, run tests, commit, and submit a pull request.

Note, a Dummy Rails application is contained within `rspec/dummy/.` for testing; you will need to migrate your database from within this directory.

#### Executing Tests

Run RSpec tests:

`bundle exec rspec`

Run Cucumber features:

`bundle exec cucumber`

### License

This project rocks and uses MIT-LICENSE.
