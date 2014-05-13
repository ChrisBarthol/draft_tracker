Feature: Results
	In order to get a real time update
    As a User
    I want to see the results of the draft by round and by NFL Team

    Scenario: Review results by round
    	Given two players drafted in different rounds by different teams
    	When I view the results by round
    	Then I should see the the players by rounds


    Scenario: Review results by team
    	Given two players drafted in different rounds by different teams
    	When I view the results by team
    	Then I should see the players by team