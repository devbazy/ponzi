require 'spec_helper'

describe Account do

	let(:user) { FactoryGirl.create(:user) }
	before do
		@account = user.build_account(
			amount: 10.0,
			daddr: "1depositzFVj8ALj6mfBsbifRoD4miY36v",
			waddr: "1withdrawFVj8ALj6mfBsbifRoD4dupsko")
	end

	subject { @account }

	it { should be_valid }
	
	it { should respond_to(:amount) }
	it { should respond_to(:daddr) }
	it { should respond_to(:waddr) }
	it { should respond_to(:user) }

	describe "when amount is < 0.0" do
		before { @account.amount = -0.2 }
		it { should_not be_valid }
	end

	describe "when deposit address is wrong" do
		before { @account.daddr = "1wr0OngaddressIlwr0OngaddressIl" }
		it { should_not be_valid }
	end

	describe "when withdraw address is wrong" do
		before { @account.waddr = "1wr0OngaddressIlwr0OngaddressIl" }
		it { should_not be_valid }
	end
end
