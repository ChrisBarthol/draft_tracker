require 'spec_helper'

describe Team do
  let(@team) { FactoryGirl.create(:team) }

  subject { @team }

  it { should respond_to(:name) }
  it { should respond_to(:divison) }

  describe "when name is not present" do
  	before { @team.name = nil }
  	it { should_not be_valid }
  end

  describe "when division is not present" do
  	before { @team.division = nil }
  	it { should_not be_valid}
  end

  describe "when team name is already taken" do
  	before do
  		team_with_same_name = @team.dup
  		team_with_same_name.name = @team.name.upcase
  		team_with_same_name.save
  	end

  	it { should_not be_valid }
  end
end
