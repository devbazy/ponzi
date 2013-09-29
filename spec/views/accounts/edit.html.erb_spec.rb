require 'spec_helper'

describe "accounts/edit" do
  before(:each) do
    @account = assign(:account, stub_model(Account,
      :amount => 1.5,
      :daddr => "MyString",
      :waddr => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit account form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", account_path(@account), "post" do
      assert_select "input#account_amount[name=?]", "account[amount]"
      assert_select "input#account_daddr[name=?]", "account[daddr]"
      assert_select "input#account_waddr[name=?]", "account[waddr]"
      assert_select "input#account_user_id[name=?]", "account[user_id]"
    end
  end
end
