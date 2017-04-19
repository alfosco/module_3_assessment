require "rails_helper"

describe "User" do
    it "sends a POST request to /api/v1/items an item is created" do
      item_params = {name: "Laser Disk", description: "The best of the best.", image_url: "qwerty"}

      post "/api/v1/items", item: item_params

      expect(response).to be_success

      item = JSON.parse(response.body)

      expect(item["name"]).to eq("Laser Disk")
      expect(item["description"]).to eq("The best of the best.")
      expect(item["image_url"]).to eq("qwerty")

      expect(item).not_to have_key("created_at")
      expect(item).not_to have_key("updated_at")
    end
end
