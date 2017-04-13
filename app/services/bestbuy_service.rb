class BestbuyService
  attr_reader :connection

  def initialize
    @connection = Faraday.new()
  end
end
