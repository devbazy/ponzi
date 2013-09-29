require 'spec_helper'

describe "accounts/show" do
  before(:each) do
    @account = assign(:account, stub_model(Account,
      :amount => 1.5,
      :daddr => "Daddr",
      :waddr => "Waddr",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    rendered.should match(/Daddr/)
    rendered.should match(/Waddr/)
    rendered.should match(/1/)
  end
end
