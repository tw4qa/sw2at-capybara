module Swat
  module Capybara
    module Exceptions

      class SwatException < RuntimeError
        MESSAGE = 'Swat Error'
        def initialize(*args)
          @args = args
          super(message(*args))
        end

        def message
          MESSAGE
        end
      end

      class ConditionIsNotMet < SwatException
        MESSAGE = "Condition isn't met"
      end

      class ElementNotFound < SwatException
        MESSAGE = 'Element not found'
      end

      class ElementFound < SwatException
        MESSAGE = "Element shouldn't appear on page"
      end

      class TextNotFound < SwatException
        MESSAGE = 'Text not found'
      end

    end
  end
end
