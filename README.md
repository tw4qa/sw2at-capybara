sw2at-capybara
==============

sw2at-capybara is a suite of methods, which help to make test automation easier, faster and more stable.

A little about sw2at-capybara
-----------------

We really like Rspec and Capybara, they work really well.

Installation
-----------------

Add to your Gemfile

    gem 'sw2at-capybara'
    
Run bundle install
    
    bundle install
    
Using
-----------------

Add to your spec_helper.rb
```ruby
    require 'capybara'
    Swat::Capybara.setup(config, { default_pause: 0.5,
       min_pause: 0.3,
       tries: 10,
       default_selector: 'body',
       output: { enabled: true, started: ?>, step: ?. }
    })
```
Examples
-----------------
[See simple swat-capybara example here!](https://github.com/tw4qa/swat-capybara-example)

How it looks
-----------------
```ruby
describe 'Google Search', type: :feature do

  before :all do
    @google_url = 'http://google.com'
    @key_to_search_by = 'swat-capybara'
    @results_we_should_see = ['sw2at/swat.gemspec at master', 'The Capybara Cave', 'https://github.com/tw4qa/sw2at']
  end

  it 'should show us a good search result' do

    step 'Go to Google' do
      visit @google_url
    end

    step 'Type key string' do
      safe_find('#lst-ib').set(@key_to_search_by)
    end

    step 'Click Search button' do
      safe_click('button[type="submit"]')
    end

    step 'Ensure that the page contains all those results' do
      @results_we_should_see.each do |text|
        sub_step "Check '#{text}' presence" do
          check_text text
        end
      end
    end
  end
end
```

![alt tag](https://github.com/tw4qa/swat-capybara-example/blob/master/console_log.png)
    
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
