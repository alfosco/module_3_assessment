require "rails_helper"

RSpec.feature "User" do
  describe "visits root" do
    it "can search for stores near their zip code" do
      visit '/'

      fill_in 'zip_code', :with => '80202'
      click_on ('Search')

      expect(current_path).to eq('/search')
      expect(page).to have_content("16 Total Stores")
    end
  end
end

# As a user
# When I visit "/"
# And I fill in a search box with "80202" and click "search"
# Then my current path should be "/search" (ignoring params)
# And I should see stores within 25 miles of 80202
# And I should see a message that says "16 Total Stores"
# And I should see exactly 10 results
# And I should see the long name, city, distance, phone number and store type for each of the 10 results