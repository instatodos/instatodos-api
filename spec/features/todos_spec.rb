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

  describe 'Create task' do
    before do
      visit todo_path(todo)
      fill_in 'title', with: 'task title'
      find('.submitTask').click
    end

    it 'creates a task in the db' do
      expect(page).to have_selector('.list-group-item', count: 1)
      expect(Task.count).to be(1)
    end
  end

  describe 'Update task completed state' do
    before do
      visit todo_path(todo_with_tasks)
    end

    xit 'modifies task state' do end
  end

  describe 'Update task title' do
    let(:new_task_title) { 'task title' }

    before do
      visit todo_path(todo_with_tasks)
    end

    xit 'modifies task title' do
      within first('.task') do
        find('.task-title').click
        expect(page).to have_selector('.edit-task', visible: true)
        find('.edit-task').set new_task_title
        expect(page).to have_selector('.task-title', visible: true )
      end
      expect(Task.find_by_title(new_task_title)).to exist
    end
  end

  describe 'Remove task' do
    before do
      visit todo_path(todo_with_tasks)
      first('.delete-task').click
    end

    it 'removes task form tasklist' do
      expect(page).to have_selector('.list-group-item', count: 2)
      expect(Task.count).to be(2)
    end
  end
end
