require "rails_helper"

RSpec.feature "User" do
  describe "visits root" do
    it "can search for stores near their zip code" do
      stores = BestbuyService.nearby_stores('80202')
      store = stores.first

      visit '/'

      fill_in 'search', :with => '80202'
      click_on ('Search')

      expect(current_path).to eq('/search')
      expect(page).to have_content("16 total stores were found")
      expect(stores.count).to eq(16)

      within first(".store") do
        expect(store[:longName]).to eq("BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER")
        expect(store[:city]).to eq("DENVER")
        expect(store[:distance]).to eq(3.45)
        expect(store[:phone]).to eq("303-270-9189")
        expect(store[:storeType]).to eq("Mobile SAS")
      end
    end
  end
end
