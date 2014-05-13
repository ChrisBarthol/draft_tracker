Given(/^(\d+) drafted players$/) do |num|
  @ownership_1 = FactoryGirl.create(:ownership, player: FactoryGirl.create(:player, name:"One"))
  @ownership_2 = FactoryGirl.create(:ownership, player: FactoryGirl.create(:player, name:"Two"))
  @ownership_3 = FactoryGirl.create(:ownership, player: FactoryGirl.create(:player, name:"Three"))
  @ownership_4 = FactoryGirl.create(:ownership, player: FactoryGirl.create(:player, name:"Four"))
end

When(/^I visit the live page$/) do
  visit live_path
end

Then(/^I should see the three players listed$/) do
  page.should have_content @ownership_2.player.name
  page.should have_content @ownership_3.player.name
  page.should have_content @ownership_4.player.name
  page.should_not have_content @ownership_1.player.name
end

Given(/^a drafted player and an order$/) do
	@order_1 = FactoryGirl.create(:order, round:1, pick:1, team: FactoryGirl.create(:team))
    @ownership_1 = FactoryGirl.create(:ownership, order: @order_1,player: FactoryGirl.create(:player, name:"One"))
    @order_2 = FactoryGirl.create(:order, round:1, pick:2, team: FactoryGirl.create(:team))
end

Then(/^I should see the next order$/) do
  page.should have_content "Pick: 2"
end

Given(/^the order is over$/) do
  Order.next = nil
end

Then(/^I should see "(.*?)"$/) do |message|
  page.should have_content message
end