require 'rails_helper'

RSpec.describe 'show todo', type: :request do
  xit 'Renders a todo' do
    get '/todos/:id'

    expect(response.status).to eq 200
    expect(json).to include('todo')
  end
end
