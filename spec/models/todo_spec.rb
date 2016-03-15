require 'rails_helper'

describe Todo do
  it { is_expected.to have_many(:tasks) }
end
