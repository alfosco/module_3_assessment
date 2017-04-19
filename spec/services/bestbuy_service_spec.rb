require "rails_helper"

describe "Bestbuy Service" do
  it "returns stores near entered zip code" do
    stores = BestbuyService.nearby_stores(80202)
    store = stores.first

    expect(stores.count).to eq(16)

    expect(store[:longName]).to eq("BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER")
    expect(store[:city]).to eq("DENVER")
    expect(store[:distance]).to eq(3.45)
    expect(store[:phone]).to eq("303-270-9189")
    expect(store[:storeType]).to eq("Mobile SAS")
  end
end
