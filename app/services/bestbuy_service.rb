class BestbuyService
  attr_reader :connection

  def initialize
    @connection = Faraday.new("https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=longName,storeType,city,distance,phone&pageSize=10&apiKey=#{Figaro.env.bestbuy_key}")
  end
end
