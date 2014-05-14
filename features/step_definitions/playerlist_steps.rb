Given(/^two undrafted players with position QB$/) do 
  @player_1 = FactoryGirl.create(:player, name: "Bob", position: "QB")
  @player_2 = FactoryGirl.create(:player, name: "Adam",position: "QB")
end

Given(/^two undrafted players with position TE$/) do 
  @player_3 = FactoryGirl.create(:player, name: "Al", position: "TE")
  @player_4 = FactoryGirl.create(:player, name: "Ted",position: "TE")
end

Given(/^a drafted player$/) do
  @drafted_player = FactoryGirl.create(:player)
  @team_1 = FactoryGirl.create(:team)
  @order_1 = FactoryGirl.create(:order, round: 1, pick: 1, team:@team_1)
  @ownership_1 = FactoryGirl.create(:ownership, order: @order_1, player: @drafted_player, team: @team_1)
end

When(/^I visit the playerlist$/) do
  visit players_undrafted_path
end

Then(/^the undrafted players should be listed alphabetically by position$/) do
  Player.undrafted.by_position.should == [@player_2,@player_1,@player_3,@player_4]
end

Then(/^the drafted player should not be listed$/) do
  page.should_not have_content "#{@drafted_player.name}"
end