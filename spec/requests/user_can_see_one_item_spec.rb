require "rails_helper"

describe "User" do
    it "sends a GET request to /api/v1/items/1 and receives a 200 JSON response" do
      item_1 = Item.create!(name: "Laser Disk", description: "The best of the best.", image_url: "qwerty")

      get "/api/v1/items/#{item_1.id}"

      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(response.status).to eq(200)
      expect(item["name"]).to eq("Laser Disk")
      expect(item["description"]).to eq("The best of the best.")
      expect(item["image_url"]).to eq("qwerty")

      expect(item).not_to have_key("created_at")
      expect(item).not_to have_key("updated_at")
    end
end
