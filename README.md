# Phonegap::Rails
[![Dependency Status](https://gemnasium.com/joscas/phonegap-rails.png)](https://gemnasium.com/joscas/phonegap-rails)

This gem provides generators for the Phonegap APIs. It is intended to be used within the scope of single page web applications that have a Ruby on Rails API backend. For example, Ember.js / Rails apps.

This gem will export assets included in the rails project as a Phonegap project. This gem won't be able to export applications where content is generated dynamically by the server (e.g applications making use of eRuby).

## Installation

Add this line to your application's Gemfile:

    gem 'phonegap-rails'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install phonegap-rails

Initialize:

    $ rails g phonegap_rails:install

Edit your config file according to your environment:

   config/phonegap_rails.yml

## Usage

### Create android project

    $ rake phonegap:rails:android:create

Perform all steps to create android project and run
(connect phone via USB if you want to install on your terminal)

		$ rake phonegap:rails:android:initall
		
### Other useful tasks

Export application application assets to the android Phonegap project

    $ rake phonegap:rails:android:export

Build project

    $ rake phonegap:rails:android:build

Launch emulator

    $ rake phonegap:rails:android:emulate

Clean

    $ rake phonegap:rails:android:clean

Log

    $ rake phonegap:rails:android:log

#### Requirements
- Phonegap
- Android SDK [http://developer.android.com](http://developer.android.com)


### Export ios project

Xcode must be installed

TODO: This section is still pending implementation

    $ rake Phonegap:rails:ios:export

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
