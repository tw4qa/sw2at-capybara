module Swat
  module Capybara
    require 'swat/capybara/rspec_setup'

    class Config
      DEFAULT_OPTIONS = {
          default_pause: 0.5,
          min_pause: 0.3,
          tries: 10,
          default_selector: 'body',
          output: { enabled: true, started: ?>, step: ?. }
      }
      def initialize(rspec_config, opts = {})
        if rspec_config
          rspec_config.include Swat::Capybara::PrintHelper
          rspec_config.include Swat::Capybara::Helpers, type: :feature
          rspec_config.extend Swat::Capybara::RspecSetup
          rspec_config.formatter = Swat::Capybara::RspecSetup::SwatFormatter
        end

        @options = DEFAULT_OPTIONS.merge opts
        @options[:output] = DEFAULT_OPTIONS[:output].merge(opts[:output] || {})
      end

      def options
        @options
      end

      def default_pause
        options[:default_pause]
      end

      def default_selector
        options[:default_selector]
      end

      def min_pause
        options[:min_pause]
      end

      def tries
        options[:tries]
      end

      def output
        options[:output] || {}
      end
    end
  end
end
