module Swat
  module Capybara
    module RspecSetup

      def init_capybara
        before(:each) do |example|
          type = example.metadata[:type] == :feature ? 'FEATURE' : 'TEST'
          $capybara_example = example
          swc_puts "\n#{ "[#{type}] " + example.description }".yellow if example.metadata[:type]
        end

        after(:each) do |example|
          if example.metadata[:type]
            if example.exception.nil?
              swc_puts "\n[PASSED] #{ example.description }".green
            else
              swc_puts "\n[FAILED] #{ example.description }".red
            end
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
