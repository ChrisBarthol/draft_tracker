require 'spec_helper'

describe Player do
  before{ @player = Player.new(name: "Troy Bona", position: "QB") }

  subject { @player }

  it { should respond_to(:name) }
  it { should respond_to(:position) }

  describe "when name is not present" do
  	before { @player.name = nil }
  	it { should_not be_valid }
  end

  describe "when position is not present" do
  	before { @player.position = nil }
  	it { should_not be_valid }
  end
end
