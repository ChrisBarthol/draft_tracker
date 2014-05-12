Given(/^an order with round (\d+) and pick (\d+)$/) do |round, pick|
  pending # express the regexp above with the code you wish you had
end

Given(/^a team "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I visit the draft page$/) do
  visit draft_url
end

Given(/^a drafted player and an undrafted player$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^an order and team$/) do
  order = FactoryGirl.create(:order)
  team = FactoryGirl.create(:team)
end

Then(/^the undrafted player should be in the draft list$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the drafted player should not be in the draft list$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^two orders, two players, and two teams$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I draft a player$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the player should have an owner$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the second order and team should be displayed$/) do
  pending # express the regexp above with the code you wish you had
end