require "rails_helper"

RSpec.describe TasksController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tasks").to route_to("tasks#index")
    end
  end
end
