require 'rails_helper'

RSpec.describe 'Home index', type: :request do
  it 'Renders a new todo with a random title' do
    get '/home'
    expect(response.status).to eq 200
    expect(json).to include('todo')
    expect(json['todo']).to include('title')
  end
end
