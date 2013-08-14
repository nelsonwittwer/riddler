require 'spec_helper'
require "cancan/matchers"

describe User do
  let(:user) { FactoryGirl.create(:user) }

  context 'active record associations' do
    subject { user }
    it { should respond_to(:games) }
  end

  context 'CanCan Authorization' do
    subject { ability }
    let(:ability){ Ability.new(user) }
    let(:other_user) { FactoryGirl.create(:user) }

    context 'for admins' do
      before { user.is_admin = true }

      it { should be_able_to(:manage, user) }
      it { should be_able_to(:manage, other_user) }
      it { should be_able_to(:manage, User) }
    end

    context 'for registered users' do
      it { should be_able_to(:manage, user) }
      it { should_not be_able_to(:update, other_user) }
    end

    context 'for guests' do
      before { user = nil }

      it { should be_able_to(:create, User) }
    end
  end

end
