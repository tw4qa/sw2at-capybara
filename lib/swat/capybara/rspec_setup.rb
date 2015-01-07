module Swat
  module Capybara
    module RspecSetup

      def init_capybara
        before(:each) do |example|
          type = example.metadata[:type] == :feature ? 'FEATURE' : 'TEST'
          swc_puts "\n#{ "[#{type}] " + example.description }".yellow
        end

        after(:each) do |example|
          if example.exception.nil?
            swc_puts "[PASSED] #{ example.description }".green
          else
            swc_puts "[FAILED] #{ example.description }".red
          end
        end

        def require_specific_helper(current_file, context)
          parts = current_file.split('/')
          parts[-1] = 'specific_helper'
          path = parts*'/'
          require path
          context.extend SpecificHelper
        end
      end

    end
  end
end
