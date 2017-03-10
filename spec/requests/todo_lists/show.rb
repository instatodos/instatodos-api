require 'rails_helper'

RSpec.describe 'show todo list', type: :request do
  xit 'Renders a todo list' do
    get '/todo_lists/:id'

    expect(response.status).to eq 200
    expect(json).to include('todo_list')
  end
end
