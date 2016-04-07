require 'rails_helper'
require 'name_generator'

describe NameGenerator do
  let(:adjective) { NameGenerator.adjective }
  let(:noun) { NameGenerator.noun }
  let(:name) { NameGenerator.name }
  let(:noun_list) { NameGenerator.load_words(:nouns) }
  let(:adjective_list) { NameGenerator.load_words(:adjectives) }

  it 'picks a random adjective from the list' do
    expect(adjective_list).to include(adjective)
  end

  it 'picks a random noun from the list' do
    expect(noun_list).to include(noun)
  end

  it 'generates a name using adjective-noun-number' do
    expect(name).to match(/\w+-\w+-\d{3}/)
  end
end
