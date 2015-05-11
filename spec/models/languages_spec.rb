require 'spec_helper'
describe Language, type: :model do
  it { is_expected.to have_many :users}
end
