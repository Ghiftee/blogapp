require 'rails_helper'

RSpec.describe Like, type: :model do
  describe '#update_counter' do
    subject { FactoryBot.build :like }

    it 'updates the likes counter' do
      expect(subject.post.likes_counter).to eq(1)
    end
  end
end
