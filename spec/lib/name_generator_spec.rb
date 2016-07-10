require "rails_helper"
require "name_generator"

describe NameGenerator do
  let(:subject) { NameGenerator.instance }
  let(:name) { subject.name }

  it "generates a name using adjective-noun-number" do
    expect(name).to match(/\w+-\w+-\d{3}/)
  end
end
