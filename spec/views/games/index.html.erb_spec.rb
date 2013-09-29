require 'spec_helper'

describe "games/index" do
  before(:each) do
    assign(:games, [
      stub_model(Game,
        :players_no => 1,
        :winners_no => 2,
        :open => false,
        :seed => 3,
        :owner_id => 4,
        :cost => 1.5
      ),
      stub_model(Game,
        :players_no => 1,
        :winners_no => 2,
        :open => false,
        :seed => 3,
        :owner_id => 4,
        :cost => 1.5
      )
    ])
  end

  it "renders a list of games" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
