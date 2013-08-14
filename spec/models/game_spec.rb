require 'spec_helper'

describe Game do
  let(:game) { FactoryGirl.create(:game) }
  subject { game }

  context 'active record associations' do
    it { should respond_to(:host_player) }
    it { should respond_to(:opponent_player) }
  end
end
