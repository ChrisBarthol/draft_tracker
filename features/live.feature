Feature: Live
	In order to see only what is actively happening
    As a User
    I want to see the latest 3 picks and which team is next to pick

    Scenario: List the last 3 picks
    	Given 3 drafted players
    	When I visit the live page
    	Then I should see the three players listed

    Scenario: Show the next team to draft
    	Given a drafter player and an order
    	When I visit the live page
    	Then I should see the next order

    Scenario: The draft is over
    	Given the order is over
    	When I visit the live page
    	Then I should see "The draft is over."