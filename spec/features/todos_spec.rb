require 'rails_helper'

feature 'Todos', js: true do
  let(:todo) { create(:todo) }
  let(:todo_with_tasks) { create(:todo_with_tasks) }

  describe 'Tasklist' do
    context 'without tasks' do
      before { visit todo_path(todo) }
      it 'Shows a spinner' do
        expect(page).to have_content("Todo: #{todo.title}")
        expect(page).to have_no_selector('.list-group-item')
        expect(page).to have_selector('.glyphicon-spin')
      end

      context 'with tasks' do
        before { visit todo_path(todo_with_tasks) }
        it 'Shows tasklist' do
          expect(page).to have_content("Todo: #{todo_with_tasks.title}")
          expect(page).to have_no_selector('.spinner')
          expect(page).to have_selector('.list-group-item', count: 3)
        end
      end
    end
  end

  describe 'Submit task' do
    before do
      visit todo_path(todo)
      fill_in 'title', with: 'task title'
      find('.submitTask').click
    end

    it 'creates a task in the db' do
      expect(page).to have_selector('.list-group-item', count: 1)
    end
  end

  describe 'Change task title' do
    before do
      visit todo_path(todo)
      # click task title
      # modify name
      # click outside task
    end
    xit 'modifies task title' do
      # expect it to have the new name
      # expect it to have the new name (db check? console.log?)
    end
  end

  describe 'Remove task' do
    before do
      allow(Task).to receive(:all).and_return ([task])
      visit todo_path(todo)
    end

    xit 'removes task form tasklist' do
      expect(page).to have_selector('.list-group-item', count: 1)
      find('.deleteTask').click
      expect(page).to have_no_selector('.list-group-item')
    end
  end
end
