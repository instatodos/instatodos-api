require 'rails_helper'

feature 'Todos', js: true do
  before { visit landing_page_path }
  describe 'Create todo' do
    xit 'creates a new todo list' do
      fill_in 'title', with: 'Title'
      click_button 'Submit'
      #expect to be redirected
    end
  end

  describe 'Show an existing todo' do
    xit 'shows the existing todo list' do
      # visit todo path with name as param
      # expect page to show tasks
    end
  end
end
