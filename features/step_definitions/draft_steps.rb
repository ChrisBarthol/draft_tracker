require 'rake'

Given(/^an order with round (\d+) and pick (\d+) a team "(.*?)"$/) do |round, pick, team|
  @team = FactoryGirl.create(:team, name: team)
  @order = FactoryGirl.create(:order, round: round, pick: pick, team: @team)
end

When(/^I visit the draft page$/) do
  visit draft_url
end

Given(/^a drafted player and an undrafted player$/) do
  @undrafted_player = FactoryGirl.create(:player)
  @drafted_player = FactoryGirl.create(:player)
  team_1 = FactoryGirl.create(:team)
  order_1 = FactoryGirl.create(:order, team: team_1)
  @ownership = FactoryGirl.create(:ownership, player_id:@drafted_player.id, team: team_1, order: order_1)
end

Given(/^an order and team$/) do
  @order_2 = FactoryGirl.create(:order)
  @team_2 = FactoryGirl.create(:team)
end

Then(/^the undrafted player should be in the draft list$/) do
  page.should have_content "#{@undrafted_player.name}"
end

Then(/^the drafted player should not be in the draft list$/) do
  page.should_not have_content "#{@drafted_player.name}"
end

Given(/^two orders, two players, and two teams$/) do
  @player_1 = FactoryGirl.create(:player)
  @player_2 = FactoryGirl.create(:player)
  @team_1 = FactoryGirl.create(:team)
  @team_2 = FactoryGirl.create(:team)
  @order_1 = FactoryGirl.create(:order, round:1, pick:1, team: @team_1)
  @order_2 = FactoryGirl.create(:order, team: @team_2)
end

When(/^I draft a player$/) do
  visit draft_url
  select @player_1.name
  click_button 'Draft Player'
end

Then(/^the player should have an owner$/) do
  @player_1.team == @team_1
end

Then(/^the second order and team should be displayed$/) do
  page.should have_content @order_2.round
  page.should have_content @order_2.pick
  page.should have_content @team_2.name
end