class String
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def yellow
    colorize(93)
  end

  def bg_yellow
    colorize(43)
  end

  def green
    colorize(32)
  end

  def blue
    colorize(96)
  end

  def dark_blue
    colorize(34)
  end

  def bg_blue
    colorize(44)
  end

  def red
    colorize(31)
  end
end