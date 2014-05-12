FactoryGirl.define do 
	factory :team do
		sequence(:name) { |n| "Team #{n}" }
	end

	factory :player do
		sequence(:name) { |n| "Player #{n}" }
	end

	factory :order do
		sequence(:round) { |n| n }
		sequence(:pick) { |n| n }
		team
		factory :drafted do
			drafted true
		end
	end

	factory :ownership do
		player
		team
		order
	end
end
