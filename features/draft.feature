Feature: Draft
	In order to record the results of the Draft in real-time
    As a System Administrator (don't implement authorization)
    I want to assign a player to a team during the draft period
    (which is defined by the draft order)

    Scenario: Show info on draft page
    	Given an order with round 1 and pick 15 a team "Philadelphia Eagles"
    	When I visit the draft page
    	Then I should see "Round: 1"
    	And I should see "Pick: 15"
    	And I should see "Philadelphia Eagles"

    Scenario: Display correct player list
    	Given a drafted player and an undrafted player
    	And an order and team
    	When I visit the draft page
    	Then the undrafted player should be in the draft list
    	And the drafted player should not be in the draft list

    Scenario: Draft a player
    	Given two orders, two players, and two teams
    	When I draft a player
    	Then the player should have an owner
    	And the second order and team should be displayed

