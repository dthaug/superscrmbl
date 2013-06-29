require "spec_helper"

describe ScramblesController do
  describe "routing" do

    it "routes to #index" do
      get("/scrambles").should route_to("scrambles#index")
    end

    it "routes to #new" do
      get("/scrambles/new").should route_to("scrambles#new")
    end

    it "routes to #show" do
      get("/scrambles/1").should route_to("scrambles#show", :id => "1")
    end

    it "routes to #edit" do
      get("/scrambles/1/edit").should route_to("scrambles#edit", :id => "1")
    end

    it "routes to #create" do
      post("/scrambles").should route_to("scrambles#create")
    end

    it "routes to #update" do
      put("/scrambles/1").should route_to("scrambles#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/scrambles/1").should route_to("scrambles#destroy", :id => "1")
    end

  end
end
