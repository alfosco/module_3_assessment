require "rails_helper"

describe "User" do
    it "sends a GET request to /api/v1/items/1 and receives a 200 JSON response" do
      item_1 = Item.create!(name: "Laser Disk", description: "The best of the best.", image_url: "qwerty")

      get "/api/v1/items/#{item_1.id}"

      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(response.status).to eq(200)
    end
end