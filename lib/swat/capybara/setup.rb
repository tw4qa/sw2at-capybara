module Swat
  module Setup
    def setup(config)
      ::Capybara::Node::Base.include Swat::Capybara::Helpers
      ::Capybara::Node::Simple.include Swat::Capybara::Helpers
      ::Capybara::Session.include Swat::Capybara::Helpers
      config.include Swat::Capybara::Helpers, type: :feature
    end
  end
end
