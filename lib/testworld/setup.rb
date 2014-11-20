class TestWorld

  module Setup

    def init_tw(options = {})
      before(:each) do
        @tw = TestWorld.new(options)
        if @tw.options[:driver]
          @prev_driver = Capybara.current_driver
          Capybara.current_driver = @tw.options[:driver]
        end
      end

      after(:each) do
        Timecop.return
        if @tw.options[:driver]
          @prev_driver = nil
          Capybara.current_driver = @prev_driver
        end
      end
    end
  end
end
