require 'swat/capybara/exceptions'
require 'tarvit-helpers/extensions/colored_string'
require 'ostruct'

module Swat
  module Capybara
    module Helpers
      include Capybara::Exceptions

      def pause(seconds = Capybara.config.default_pause)
        sleep seconds
      end

      def explain_step(message)
        swat_logger.print "\n - #{message.blue}"
        yield() if block_given?
      rescue Exception => ex
        print_exception(ex)
        raise_again = !swat_stop_fail?
        binding.pry if swat_debug?
        raise ex if raise_again
      end

      def print_exception(ex)
        swat_logger.print "\n#{ex.message.red}\n"
        ex.backtrace.each do |line|
          swat_logger.print "\n#{line.red}"
        end
      end

      alias_method :step, :explain_step

      def check_condition(tries = Capybara.config.tries)
        res = wait_for_condition(tries) do
          !!yield()
        end
        raise ConditionIsNotMet unless res
      end

      def check_presence(*args)
        wait_for_condition do
          all(*args).count > 0
        end
        raise ElementNotFound unless all(*args).count > 0
      end

      def check_absence(*args)
        wait_for_condition do
          all(*args).count == 0
        end
        raise ElementFound unless all(*args).count == 0
      end

      def safe_click(*args)
        safe_find(*args).click
      end

      def safe_find(*args)
        wait_for_condition do
          all(*args).count == 1
        end
        find(*args)
      end

      def safe_find_all(*args)
        res = wait_for_condition do
          all(*args).count > 0
        end
        print_failed_args(res, args)
        all(*args)
      end

      def select_option(selector, value)
        dropdown = safe_find(selector)
        wait_for_condition do
          dropdown.all(:option).map(&:text).include? value
        end
        dropdown.all(:option).select{|op| op.text == value}.first.select_option
      end

      def safe_set(field, value)
        safe_find(field).set(value)
      end

      def page_refresh
        page.driver.browser.navigate.refresh
      end

      def sub_step(message)
        swat_logger.print "\n    > #{message.blue} ".yellow
        yield() if block_given?
      end

      def xstep name
        swat_logger.print "Skipped step: #{name}"
      end

      def click_by_text(text, tag='span')
        safe_click(tag, text: text)
      end

      def check_text(text, selector=Capybara.config.default_selector, tries=Capybara.config.tries)
        result = nil
        wait_for_condition(tries) do
          container = safe_find(selector)
          local_text = container.text
          result = Hash[
              [ text ].flatten.map do |word|
                [ word, local_text.include?(word) ]
              end
          ]
          result.values.all?{|v|v}
        end
        result.each do |k,v|
          print_failed_args(v, [text, selector], "\nText '#{k}' NOT found") unless v
        end
        raise TextNotFound unless result.values.all?{|v|v}
        true
      end

      def check_no_text(text, selector=Capybara.config.default_selector, tries=Capybara.config.tries)
        result = nil
        wait_for_condition(tries) do
          container = safe_find(selector)
          result = Hash[
              [ text ].flatten.map do |word|
                [ word, !container.text.include?(word) ]
              end
          ]
          result.values.all?{|v|v}
        end
        result.each do |k,v|
          print_failed_args(v, [text, selector], "\nText '#{k}' WAS found") unless v
        end
        raise TextWasFound unless result.values.all?{|v|v}
        true
      end

      def wait_for_condition(tries = Capybara.config.tries, &condition)
        swat_logger.print Capybara.config.output[:started]
        tries.times do
          swat_logger.print Capybara.config.output[:step]
          result = condition.()
          return result if result
          sleep(Capybara.config.min_pause)
          false
        end
        swat_logger.puts "Failed: #{condition.to_source.red}" rescue nil
        result = ENV['SWAT_STOP_FAIL'] || false
        binding.pry if (ENV['FPRY'] || ENV['SWAT_DBG'])
        result
      end

      def print_failed_args(res, args, message=nil)
        swat_logger.puts message.yellow if message
        swat_logger.puts "    With args: [#{args*', '}]".red  unless res
      end

      def swat_store
        @swat_store ||= OpenStruct.new
      end

      def swat_logger
        swat_store.swat_logger ||= TarvitHelpers::ConditionalLogger.new do
          !ENV['SWAT_LOGS_DISABLED']
        end
      end

      def swat_stop_fail?
        !!ENV['SWAT_STOP_FAIL']
      end

      def swat_debug?
        ENV['SWAT_DBG'] || ENV['FPRY']
      end
    end

  end
end
