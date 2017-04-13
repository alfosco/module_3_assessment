class Store
  attr_reader :name, :city, :distance, :phone_number, :store_type

  def initialize(store = {})
    @name = store[:longName]
    @city = store[:city]
    @distance = store[:distance]
    @phone_number = store[:phone]
    @store_type = store[:storeType]
  end

  def self.find_near_zipcode(zip_code)
    stores = BestbuyService.nearby_stores(zip_code)

    stores.map do |store|
      Store.new(store)
    end
  end
end
