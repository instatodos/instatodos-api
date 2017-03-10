require "rails_helper"

describe Todo do
  it { is_expected.to belong_to(:todo_list) }
end
