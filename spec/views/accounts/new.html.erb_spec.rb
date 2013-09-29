require 'spec_helper'

describe "accounts/new" do
  before(:each) do
    assign(:account, stub_model(Account,
      :amount => 1.5,
      :daddr => "MyString",
      :waddr => "MyString",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new account form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", accounts_path, "post" do
      assert_select "input#account_amount[name=?]", "account[amount]"
      assert_select "input#account_daddr[name=?]", "account[daddr]"
      assert_select "input#account_waddr[name=?]", "account[waddr]"
      assert_select "input#account_user_id[name=?]", "account[user_id]"
    end
  end
end
