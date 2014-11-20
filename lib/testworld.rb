class TestWorld
  require 'testworld/methods'
  require 'testworld/templates'
  require 'testworld/data_generator'
  require 'testworld/situations'
  require 'testworld/setup'
  require 'testworld/helpers'

  include Methods

  attr_reader :options

  def initialize(opts)
    @options = opts
  end

end
