require "rails_helper"

describe "User" do
    it "sends a GET request to /api/v1/items and receives a 200 JSON response containing all items" do
      item_1 = Item.create!(name: "Laser Disk", description: "The best of the best.", image_url: "qwerty")
      item_2 = Item.create!(name: "VCR", description: "You know you want one.", image_url: "asdfgh")
      item_3 = Item.create!(name: "Gameboy", description: "Its awesome.", image_url: "zxcvbn")

      get '/api/v1/items'

      expect(response).to be_success
      expect(response.status).to eq(200)

      all_items = JSON.parse(response.body)

      expect(all_items).to be_an(Array)
      expect(all_items.count).to eq(3)
    end
end
