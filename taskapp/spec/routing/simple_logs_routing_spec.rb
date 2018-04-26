require "rails_helper"

RSpec.describe SimpleLogsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/simple_logs").to route_to("simple_logs#index")
    end

    it "routes to #new" do
      expect(:get => "/simple_logs/new").to route_to("simple_logs#new")
    end

    it "routes to #show" do
      expect(:get => "/simple_logs/1").to route_to("simple_logs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/simple_logs/1/edit").to route_to("simple_logs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/simple_logs").to route_to("simple_logs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/simple_logs/1").to route_to("simple_logs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/simple_logs/1").to route_to("simple_logs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/simple_logs/1").to route_to("simple_logs#destroy", :id => "1")
    end

  end
end
