require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(name: 'Cross', photo: 'CR', bio: 'My bio', posts_counter: 3) }

  before { subject.save }

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

  describe '#recent_posts' do
    subject { User.first }

    it 'should return the first 3 posts' do
      expect(subject.recent_posts.length).to be(3)
    end
  end
end
