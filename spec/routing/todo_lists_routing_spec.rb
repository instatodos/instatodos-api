require "rails_helper"

describe TodoListsController do
  describe "routing" do
    it "routes to #show" do
      expect(get: "/todo_lists/1").to route_to("todo_lists#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/todo_lists").to route_to("todo_lists#create")
    end
  end
end
