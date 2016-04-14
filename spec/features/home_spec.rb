require "rails_helper"

feature "Home" do
  before { visit home_index_path }

  describe "Create todo" do
    let(:todo) { Todo.last }

    before do
      fill_in :todo_title, with: "Title"
      click_button "Create"
    end

    it "redirects to the new todo list" do
      expect(page.current_path).to eq todo_path(todo)
    end
  end
end
