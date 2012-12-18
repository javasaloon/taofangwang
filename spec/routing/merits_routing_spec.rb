require "spec_helper"

describe MeritsController do
  describe "routing" do

    it "routes to #index" do
      get("/merits").should route_to("merits#index")
    end

    it "routes to #new" do
      get("/merits/new").should route_to("merits#new")
    end

    it "routes to #show" do
      get("/merits/1").should route_to("merits#show", :id => "1")
    end

    it "routes to #edit" do
      get("/merits/1/edit").should route_to("merits#edit", :id => "1")
    end

    it "routes to #create" do
      post("/merits").should route_to("merits#create")
    end

    it "routes to #update" do
      put("/merits/1").should route_to("merits#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/merits/1").should route_to("merits#destroy", :id => "1")
    end

  end
end
