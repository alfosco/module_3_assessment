class BestbuyService

  def self.nearby_stores(zipcode)
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zipcode},25))?format=json&show=longName,city,distance,phone,storeType&pageSize=16&apiKey=#{Figaro.env.bestbuy_key}")
    stores = parse(response)[:stores]
  end

  private

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end
