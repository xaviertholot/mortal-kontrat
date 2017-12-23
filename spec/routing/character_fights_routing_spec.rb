require "rails_helper"

RSpec.describe CharacterFightsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/character_fights").to route_to("character_fights#index")
    end


    it "routes to #show" do
      expect(:get => "/character_fights/1").to route_to("character_fights#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/character_fights").to route_to("character_fights#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/character_fights/1").to route_to("character_fights#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/character_fights/1").to route_to("character_fights#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/character_fights/1").to route_to("character_fights#destroy", :id => "1")
    end

  end
end
