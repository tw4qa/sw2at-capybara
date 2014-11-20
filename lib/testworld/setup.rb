class TestWorld

  module Setup

    def init_tw(options = BASE_OPTIONS)
      before(:each) do
        Timecop.travel( TestWorld.moment )
        @tw = TestWorld.new(options)
        @tw.clean_attachments
        if @tw.options[:driver]
          @prev_driver = Capybara.current_driver
          Capybara.current_driver = @tw.options[:driver]
        end
        login @tw.options[:login]
      end

      after(:each) do
        Timecop.return
        @tw.clean_attachments
        if @tw.options[:driver]
          @prev_driver = nil
          Capybara.current_driver = @prev_driver
        end
      end
    end
  end
end
