require "rails_helper"

describe TodosController do
  describe "routing" do
    it "routes to #show" do
      expect(:get => "/todos/1").to route_to("todos#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/todos").to route_to("todos#create")
    end
  end
end
