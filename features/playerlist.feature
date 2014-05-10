Feature: Playerlist
	In order to see which players are still draftable
    As a User
    I want to be able to view all remaining players alphabetically by position

	Scenario: View undrafted players
		Given two undrafted players with position "QB"
		And two undrafted players with position "RB"
		And a drafted player
		When I visit the playerlist
		Then the undrafted players should be listed alphabetically by position
		And the drafted player should not be listed