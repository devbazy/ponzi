require 'spec_helper'

describe Game do

	let(:users) { FactoryGirl.create_list(:user_with_account, 4) }
	
	before do
		@game = FactoryGirl.create(:game_4_1_23_01_3)
		@game.users = users
		@game.save
	end
=begin
	before do
		game.users = @users
	end
=end
	subject { @game }

	it { should be_valid }

	it { should respond_to(:players_no) }
	it { should respond_to(:winners_no) }
	it { should respond_to(:open) }
	it { should respond_to(:seed) }
	it { should respond_to(:owner_id) }
	it { should respond_to(:cost) }
	it { should respond_to(:old_game_id) }
	it { should respond_to(:rounds) }

	describe "#play_game" do
		let(:before_playing) {
			@game.users.map(&:account).map(&:amount).inject { |sum, a| sum += a }
		}
		let(:my_overall_fee) { @game.rounds * @game.players_no * @game.cost * Fee::fee }
		
		before { @game.play_game }

		it "should change users account's amount" do
			User.find(@game.user_ids)
				.map(&:account)
				.map(&:amount)
				.inject { |sum, a| 
					sum += a 
				}.should eq(before_playing - my_overall_fee)
		end
	end

=begin
	it "#play" do
		user_accounts = @game.users.map(&:account)
		fee = @game.cost * Fee::fee * @game.players_no * @game.rounds

		@game.play_game

		expect(@game.users.map(&:account).map(&:amount)).not_to eq([10.0, 10.0, 10.0, 10.0])
	end
=end		
=begin

		let(:fee) do
			@game.cost * Fee::fee * @game.players_no * @game.rounds
		end

		let(:user_accounts) { @game.users.map(&:account) }

		it "after playing" do
			expect { @game.play_game }.to change.by(fee)
		end
	end 
=end

	describe "when user doesn't have money for all rounds" do
		before do
			@game.users.first.account.amount = 0.3
			@game.rounds = 4
		end

		it { should_not be_valid }
	end

	describe "when rounds is 0 or negative" do
		before { @game.rounds = -1 }
		it { should_not be_valid }
	end

	describe "when players_no is negative" do
		before { @game.players_no = -5 }
		it { should_not be_valid }
	end

	describe "when winners_no is negative" do
		before { @game.winners_no = -1 }
		it { should_not be_valid }
	end

	describe "when winners_no is equal or greater than players_no" do
		before { @game.winners_no = users.size + 3 }
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
