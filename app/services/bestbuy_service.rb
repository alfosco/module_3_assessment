class BestbuyService
  attr_reader :connection

  def initialize
    @connection = Faraday.new("https://api.bestbuy.com/v1/")
  end

  def nearby_stores(zip_code)
    parse(connection.get(stores(area("#{zip_code},25))?format=json&show=longName,storeType,city,distance,phone&pageSize=10&apiKey=#{Figaro.env.bestbuy_key}"))
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
