require 'spec_helper'

describe "accounts/index" do
  before(:each) do
    assign(:accounts, [
      stub_model(Account,
        :amount => 1.5,
        :daddr => "Daddr",
        :waddr => "Waddr",
        :user_id => 1
      ),
      stub_model(Account,
        :amount => 1.5,
        :daddr => "Daddr",
        :waddr => "Waddr",
        :user_id => 1
      )
    ])
  end

  it "renders a list of accounts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Daddr".to_s, :count => 2
    assert_select "tr>td", :text => "Waddr".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
