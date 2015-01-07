module Swat
  module Capybara
    require 'swat/capybara/print_helper'
    require 'swat/capybara/helpers'
    require 'swat/capybara/config'

    def self.setup(rspec_config, opts = {})
      @config ||= Config.new(rspec_config, opts)
    end

    def self.config
      @config
    end
  end
end
