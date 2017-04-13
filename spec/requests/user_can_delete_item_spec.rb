require "rails_helper"

describe "User" do
    it "sends a DELETE request to /api/v1/items/1 it deletes item" do
      item_1 = Item.create!(name: "Laser Disk", description: "The best of the best.", image_url: "qwerty")

      expect(Item.count).to eq(1)

      delete "/api/v1/items/#{item_1.id}"

      expect(response).to be_success
      expect(response.status).to eq(200)
      expect(Item.count).to eq(0)
    end
end
