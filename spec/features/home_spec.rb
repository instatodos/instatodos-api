require 'rails_helper'

feature 'Home', js: true do
  before { visit home_index_path }
  describe 'Create todo' do
    before do
      fill_in 'title', with: 'Title'
      click_button 'createTodo'
    end

    xit 'creates a new todo list' do
      created_task_id = Task.last
      expect(page.current_path).to eq tasks_path(created_task_id)
    end
  end

  describe 'Show an existing todo' do
    xit 'shows the existing todo list' do
      # visit todo path with name as param
      # expect page to show tasks
    end
  end
end
