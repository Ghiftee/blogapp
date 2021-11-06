require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'Cross', photo: 'CR', bio: 'My bio', posts_counter: 3) }
  let(:post) do
    described_class.create(user: user, title: 'My first post', text: 'Text to post', comments_counter: 0,
                           likes_counter: 0)
  end
  describe 'validations' do
    describe 'title' do
      context 'when valid' do
        it { expect(post).to be_valid }
      end

      context 'when not valid' do
        subject { described_class.new }
        it 'should be present' do
          expect(subject).to_not be_valid
        end

        it 'should have title with at most 250 characters' do
          subject.title = 'My post' * 250
          expect(subject).to_not be_valid
        end
      end
    end

    describe 'comments_counter' do
      it 'should allow valid values' do
        subject.comments_counter = 0.23
        expect(subject).to_not be_valid
      end

      it 'should allow valid values' do
        subject.comments_counter = 0
        expect(subject).to_not be_valid
      end

      it 'should allow valid values' do
        subject.comments_counter = -2
        expect(subject).to_not be_valid
      end
    end
  end
end
