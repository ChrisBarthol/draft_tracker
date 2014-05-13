require 'spec_helper'

describe Ownership do
  before{ @ownership = Ownership.new(player_id: 1, team_id: 3, order_id: 5) }

  subject { @ownership }

  it { should respond_to(:player_id) }
  it { should respond_to(:team_id) }
  it { should respond_to(:order_id) }

  describe "when player_id is not present" do
  	before { @ownership.player_id = nil }
  	it { should_not be_valid }
  end

  describe " when team_id is not present" do
  	before { @ownership.team_id = nil }
  	it { should_not be_valid }
  end

  describe " when order_id is not present" do
  	before { @ownership.order_id = nil }
  	it { should_not be_valid }
  end
end
