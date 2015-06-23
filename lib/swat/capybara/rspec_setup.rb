module Swat
  module Capybara
    module RspecSetup

      require 'rspec'
      require 'rspec/core/formatters'
      require 'rspec/core/formatters/base_formatter'

      class SwatFormatter < RSpec::Core::Formatters::BaseFormatter
        require 'tarvit-helpers/extensions/colored_string'
        require 'tarvit-helpers/modules/conditional_logger'

        RSpec::Core::Formatters.register self, :example_started, :example_passed, :example_failed, :start, :stop

        START_MESSAGE = <<STM

   _|_|_|  _|          _|    _|_|    _|_|_|_|_|
 _|        _|          _|  _|    _|      _|
   _|_|    _|    _|    _|  _|_|_|_|      _|
       _|    _|  _|  _|    _|    _|      _|
 _|_|_|        _|  _|      _|    _|      _|
STM

        def initialize(arg)
          super
          @swat_logger = TarvitHelpers::ConditionalLogger.new do
            !ENV['SWAT_LOGS_DISABLED']
          end
        end

        def start(notification)
          @swat_logger.puts START_MESSAGE.blue
        end

        def example_started(notification)
          @started = Time.now
          @swat_logger.puts "\n[FEATURE] #{notification.example.description}".yellow
        end

        def example_passed(notification)
          @swat_logger.puts "\n[PASSED] #{ notification.example.description } (#{ finished_in(notification.example) })".green
        end

        def example_failed(notification)
          @swat_logger.puts "\n[FAILED] #{ notification.example.description } (#{ finished_in(notification.example) })".red
        end

        def stop(notification)
          # Do nothing
        end

        private

        def finished_in(example)
          test_duration = Time.at(example.metadata[:execution_result].run_time)
          Time.at(test_duration).utc.strftime("%H:%M:%S")
        end

      end

      def init_capybara(rspec_config)
        # adds possiblity to create helpers automatically required and extended by a convention
        def require_specific_helper(current_file, context)
          parts = current_file.split('/')
          parts[-1] = 'specific_helper'
          path = parts*'/'
          require path
          context.extend eval('SpecificHelper')
        end
      end

    end
  end
end
