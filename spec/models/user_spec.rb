require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create!(name: 'Cross', photo: 'CR', bio: 'My bio', posts_counter: 3) }

  describe 'validations' do
    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'posts_counter should be present' do
      subject.posts_counter = nil
      expect(subject).to_not be_valid
    end
  end

end
