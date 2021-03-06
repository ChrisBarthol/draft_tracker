require 'spec_helper'

describe "StaticPages" do

  subject { page }

  shared_examples_for "all static pages" do
  	it { should have_selector('h1', text: heading) }
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading) { 'Welcome to the NFL Draft Tracker' }

    it_should_behave_like "all static pages"
    it { should have_content('Welcome to the NFL Draft Tracker') }
  end

  describe "Help page" do
  	before { visit help_path }
  	let(:heading) { 'NFL Draft Tracker Help' }

    it_should_behave_like "all static pages"
  end

  describe "Results page" do
  	before { visit results_path }
  	let(:heading) { 'NFL Draft Results' }
  	let!(:team1) { FactoryGirl.create(:team) }

    it_should_behave_like "all static pages"
    it { should have_content('Round') }
    it { should have_content('Pick') }
    it { should have_content('Team') }
  end

  describe "Live page" do
  	before { visit live_path }
  	let(:heading) { 'NFL Draft Live' }
  	let(:order) { FactoryGirl.create(:order) }
  	let(:player) { FactoryGirl.create(:player)}
  	let(:team) { FactoryGirl.create(:team) }

    it_should_behave_like "all static pages"
    it { should have_content('Last Three') }
  end

  describe "Draft page" do
  	before { visit draft_path }
  	let(:heading) { 'NFL Draft' }
  	let(:order) { FactoryGirl.create(:order) }
  	let(:player) { FactoryGirl.create(:player)}
  	let(:team) { FactoryGirl.create(:team) }

    it_should_behave_like "all static pages"

  end
end
