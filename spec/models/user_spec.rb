require 'spec_helper'

describe User do
	
	before do
		@user = User.new(login: "Example", email: "user@exmaple.org")
	end

	subject { @user }

	it { should respond_to(:login) }
	it { should respond_to(:email) }

	it { should respond_to(:account) }

	describe "when name is not present" do
		before { @user.login = " " }
		it { should_not be_valid }
	end

	describe "when email is not present" do
		before { @user.email = " " }
		it { should_not be_valid }
	end

	describe "when login is too long" do
		before { @user.login = "a" * 31 }
		it { should_not be_valid }
	end

	describe "when login is too short" do
		before { @user.login = "a" * 2 }
		it { should_not be_valid }
	end

	describe "when email format is invalid" do
		it "should be invalid" do
			addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
			addresses.each do |invalid_address|
				@user.email = invalid_address
				expect(@user).not_to be_valid
			end
		end
	end

	describe "when email format is valid" do
		it "should be valid" do
			addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
			addresses.each do |valid_address|
				@user.email = valid_address
				expect(@user).to be_valid
			end
		end
	end

	describe "when email address is already taken" do
		before do
			user_with_same_email = @user.dup
			user_with_same_email.email = @user.email.upcase
			user_with_same_email.save
		end

		it { should_not be_valid }
	end

	describe "email addres with mixed case" do
		let(:mixed_case_email) { "Foo@ExAMPle.CoM" }

		it "should be saved as all lower-case" do
			@user.email = mixed_case_email
			@user.save
			expect(@user.email).to eq mixed_case_email.downcase
		end
	end
end