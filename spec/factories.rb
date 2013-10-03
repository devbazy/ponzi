FactoryGirl.define do 
	factory :user do
		sequence(:login) { |n| "Person_#{n}" }
		sequence(:email) { |n| "person_#{n}@example.org" }
	end

	factory :game_4_1_23 do
		players_no	4
		winner_no	1
		open		true
		seed		23
		cost		0.1
	end
end