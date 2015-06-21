module Swat
  module Capybara
    module PrintHelper

      def swc_puts *args
        puts(*args) if Capybara.config.output[:enabled]
      end
      alias_method :demo_message, :swc_puts
      alias_method :comment, :swc_puts

      def swc_print *args
        print(*args) if Capybara.config.output[:enabled]
      end

    end
  end
end

