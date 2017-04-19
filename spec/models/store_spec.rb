require "rails_helper"

describe "store PORO" do
  it "returns array of stores" do
    stores = Store.find_near_zipcode("80202")
    store = stores.first

    expect(stores).to be_a(Array)
    expect(stores.count).to eq(16)

    expect(store.name).to eq("BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER")
    expect(store.city).to eq("DENVER")
    expect(store.distance).to eq(3.45)
    expect(store.phone_number).to eq("303-270-9189")
    expect(store.store_type).to eq("Mobile SAS")
  end
end
