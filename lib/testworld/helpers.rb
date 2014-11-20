class TestWorld

  module Helpers
    DEFAULT_PAUSE = 0.5
    MIN_PAUSE = 0.3
    TRIES = 10

    def pause(seconds = DEFAULT_PAUSE)
      sleep seconds
    end

    def check_condition(tries = TRIES)
      res = wait_for_condition(tries) do
        yield()
      end
      expect(res).to be_truthy
    end

    def check_presence(*args)
      wait_for_condition do
        all(*args).count == 1
      end
      expect(all(*args).count).to eq 1
    end

    def check_absence(*args)
      wait_for_condition do
        all(*args).count == 0
      end
      expect(all(*args).count).to eq 0
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

    def click_by_text(text, tag='span')
      safe_click(tag, text: text)
    end

    def wait_for_condition(tries = TRIES)
      print ?>
      tries.times do |t|
        print ?.
        result = yield()
        return result if result
        sleep(MIN_PAUSE)
        false
      end
      false
    end
  end
end
