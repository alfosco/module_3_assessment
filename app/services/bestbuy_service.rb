class BestbuyService

  def self.nearby_stores(zipcode)
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zipcode},25))?format=json&show=longName,city,distance,phone,storeType&pageSize=10&apiKey=#{Figaro.env.bestbuy_key}")
    stores = JSON.parse(response.body, symbolize_names: true)[:stores]
  end

end
