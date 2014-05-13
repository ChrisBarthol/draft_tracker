require 'spec_helper'

describe Order do
    before{ @order = Order.new(round: "1", pick: "23", team_id: 2) }

  subject { @order }

  it { should respond_to(:round) }
  it { should respond_to(:pick) }
  it { should respond_to(:team_id) }

  describe "when round is not present" do
  	before { @order.round = nil }
  	it { should_not be_valid }
  end

  describe "when pick is not present" do
  	before { @order.pick= nil }
  	it { should_not be_valid }
  end

  describe "when team_id is not present" do
  	before { @order.team_id = nil }
  	it { should_not be_valid }
  end
end
