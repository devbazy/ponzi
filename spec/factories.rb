FactoryGirl.define do 
	factory :user do
		sequence(:login) { |n| "Person_#{n}" }
		sequence(:email) { |n| "person_#{n}@example.org" }
	
		factory :user_with_account do
			association :account, factory: :account_10
		end
	end

	factory :account_10, class: Account do
		amount	10.0
		daddr	"1depositzFVj8ALj6mfBsbifRoD4miY36v"
		waddr	"1withdrawFVj8ALj6mfBsbifRoD4dupsko"
	end

	factory :game_4_1_23_01, class: Game do
		players_no	4
		winners_no	1
		open		true
		seed		23
		cost		0.1
	end
end