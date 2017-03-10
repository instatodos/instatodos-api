require 'rails_helper'

RSpec.describe 'Todo List create', type: :request do
  xit 'Renders a random todo list title' do
    post '/todo_lists'

    expect(response.status).to eq 200
    expect(json).to include('todo_list')
  end
end
