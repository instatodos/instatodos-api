require 'rails_helper'

describe Task do
  it { is_expected.to belong_to(:todo) }
end
