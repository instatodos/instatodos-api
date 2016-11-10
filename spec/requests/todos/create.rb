require 'rails_helper'

RSpec.describe 'Todo create', type: :request do
  xit 'Renders a random todo title' do
    post '/todos'

    expect(response.status).to eq 200
    expect(json).to include('todo')
  end
end
