sw2at-capybara
==============

sw2at-capybara is a suite of methods, which help to make test automation easier, faster and more stable.

Installation
-----------------

Add to your Gemfile

    gem 'sw2at-capybara'
    
Run bundle install
    
    bundle install
    
Using
-----------------

Add to your spec_helper.rb

    require 'capybara'
    Swat::Capybara.setup(config, { default_pause: 0.5,
       min_pause: 0.3,
       tries: 10,
       default_selector: 'body',
       output: { enabled: true, started: ?>, step: ?. }
    })
    
Contributing to sw2at-capybara
-----------------
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

Copyright
-----------------
Copyright (c) 2015 Vitaly Tarasenko. See LICENSE.txt for
further details.

Example
-----------------
[See simple swat-capybara example here!](https://github.com/tw4qa/swat-capybara-example)
