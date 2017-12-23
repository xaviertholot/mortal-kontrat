require 'rails_helper'

RSpec.describe "CharacterFights", type: :request do
  describe "GET /character_fights" do
    it "works! (now write some real specs)" do
      get character_fights_path
      expect(response).to have_http_status(200)
    end
  end
end
