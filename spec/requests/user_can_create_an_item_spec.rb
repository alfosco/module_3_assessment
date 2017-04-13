require "rails_helper"

describe "User" do
    it "sends a POST request to /api/v1/items an item is created" do
      item_params = {name: "Laser Disk", description: "The best of the best.", image_url: "qwerty"}

      post "/api/v1/items", params: {item: item_params}

      item = Item.last

      expect(response).to be_success
      expect(item.name).to eq(item_params[:name])
    end
end
