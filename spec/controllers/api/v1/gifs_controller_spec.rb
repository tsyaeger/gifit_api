require 'rails_helper'

RSpec.describe Api::V1::GifsController do
  describe "GET #index" do
    before do
      Gif.create([
        { url: "https://media3.giphy.com/media/10htoZz7rhLZ6w/giphy.gif?cid=e1bb72ff5b7c64c07437726255d57718"},
        { url: "https://media1.giphy.com/media/y63H09ZvHJdf2/giphy.gif?cid=e1bb72ff5b847740777678366b770bf1"}
      ])

      get :index
    end
    
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "JSON body response contains expected gif attributes" do
      json_response = JSON.parse(response.body)
      expect(json_response.count).to eq(2)
      expect(json_response.first.keys).to match_array(["id", "url", "created_at", "updated_at"])
    end
  end

  describe "POST #create" do
    let(:url) { "https://media3.giphy.com/media/10htoZz7rhLZ6w/giphy.gif?cid=e1bb72ff5b7c64c07437726255d57718" }

    before do      
      gif_params = { gif: { url: url } }
      post :create, params: gif_params
    end
    
    it "returns http success" do
      expect(response).to have_http_status(:success)
      json_response = JSON.parse(response.body)
      expect(Gif.count).to eq 1
      expect(json_response["url"]).to eq url
    end
  end
end
