require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create!(name: 'Cross', photo: 'CR', bio: 'My bio', posts_counter: 3) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

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
    it 'should return the first 3 posts' do
      subject.posts.create!(title: 'Post 1', text: 'Body 1')
      subject.posts.create!(title: 'Post 2', text: 'Body 2')
      subject.posts.create!(title: 'Post 3', text: 'Body 3')
      expect(subject.recent_posts.length).to be(3)
    end
  end
end
