require "spec_helper"

describe OldGamesController do
  describe "routing" do

    it "routes to #index" do
      get("/old_games").should route_to("old_games#index")
    end

    it "routes to #new" do
      get("/old_games/new").should route_to("old_games#new")
    end

    it "routes to #show" do
      get("/old_games/1").should route_to("old_games#show", :id => "1")
    end

    it "routes to #edit" do
      get("/old_games/1/edit").should route_to("old_games#edit", :id => "1")
    end

    it "routes to #create" do
      post("/old_games").should route_to("old_games#create")
    end

    it "routes to #update" do
      put("/old_games/1").should route_to("old_games#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/old_games/1").should route_to("old_games#destroy", :id => "1")
    end

  end
end
