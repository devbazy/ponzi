require 'spec_helper'

describe Game do

	before do
		@users = FactoryGirl.create_list(:user_with_account, 4)
		@game = FactoryGirl.create(:game_4_1_23_01)

		@game.users = @users
	end

	subject { @game }

	it { should be_valid }

	it { should respond_to(:players_no) }
	it { should respond_to(:winners_no) }
	it { should respond_to(:open) }
	it { should respond_to(:seed) }
	it { should respond_to(:owner_id) }
	it { should respond_to(:cost) }
	it { should respond_to(:old_game_id) }

	describe "when players_no is negative" do
		before { @game.players_no = -5 }
		it { should_not be_valid }
	end

	describe "when winners_no is negative" do
		before { @game.winners_no = -1 }
		it { should_not be_valid }
	end

	describe "when winners_no is equal or greater than players_no" do
		before { @game.winners_no = @users.size + 3 }
		it { should_not be_valid }
	end

	describe "cost" do
		describe "is negative" do
			before { @game.cost = -2.0 }
			it { should_not be_valid }
		end

		describe "is zero" do
			before { @game.cost = 0.0 }
			it { should_not be_valid }
		end
	end

	describe "open" do
		before { @game.open = false }
		it { should_not be_valid }
	end

	describe "when user doesn't have such amount to play" do
		before do
			@game.users.first.account.amount = 1.0
			@game.cost = 2.0
		end
		it { should_not be_valid }
	end

end
