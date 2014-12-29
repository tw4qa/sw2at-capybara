module Swat
  module Capybara
    module RspecSetup

      def init_capybara
        before(:each) do |example|
          if example.metadata[:type] == :feature
            swc_puts "\n #{ ?*.yellow } #{(' [ Test: ] ' + example.description + ' ').yellow }"
          end
        end

        after(:each) do |example|
          swc_puts "\n"+('-'*35 + ' END ' + '-'*35).yellow if @swc_step
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
