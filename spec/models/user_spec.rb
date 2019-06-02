# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:auth) do
    {
      uid: 'mallowlabs',
      provider: 'twitter',
      name: 'mallowlabs',
      info: { name: 'mallowlabs' }
    }
  end

  describe '#find_for_oauth' do
    context 'with new user' do
      subject { User.find_for_oauth(auth) }

      it { expect(subject.name).to eq('mallowlabs') }
    end

    context 'with existing user' do
      subject { User.find_for_oauth(auth) }

      before { FactoryBot.create(:user, uid: 'mallowlabs', provider: 'twitter') }

      it { expect(subject.name).to eq('テストユーザー') }
    end
  end
end
