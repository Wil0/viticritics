require 'rails_helper'

RSpec.describe Movie, type: :model do
  subject { create :example_movie }
  describe 'A movie must have the required attributes to be valid' do
    it { is_expected.to be_valid }
  end
end
