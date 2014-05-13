Given(/^two players drafted in different rounds by different teams$/) do
  
  @team_1 = FactoryGirl.create(:team, name:"Philadelphia Eagles")
  @team_2 = FactoryGirl.create(:team, name:"Arizona Cardinals")
  @player_1 = FactoryGirl.create(:player, name: "P One")
  @player_2 = FactoryGirl.create(:player, name: "P Two")
  @order_1 = FactoryGirl.create(:order, round: 1, pick: 1, team:@team_1)
  @order_2 = FactoryGirl.create(:order, round: 2, pick: 45, team:@team_2)
  @ownership_1 = FactoryGirl.create(:ownership, order: @order_1, player: @player_1, team: @team_1)
  @ownership_1 = FactoryGirl.create(:ownership, order: @order_2, player: @player_2, team: @team_2)

end

When(/^I view the results by round$/) do
  visit results_path
  click_link "Philadelphia Eagles"
end

Then(/^I should see the the players by rounds$/) do
  page.should have_content @player_1.name
  page.should_not have_content @player_2.name
end



When(/^I view the results by team$/) do
  visit results_path
  click_link @team_1.name
end

Then(/^I should see the players by team$/) do
  page.should have_content @player_1.name
  page.should_not have_content @player_2.name
end