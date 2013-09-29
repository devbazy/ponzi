require 'spec_helper'

describe "games/show" do
  before(:each) do
    @game = assign(:game, stub_model(Game,
      :players_no => 1,
      :winners_no => 2,
      :open => false,
      :seed => 3,
      :owner_id => 4,
      :cost => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/false/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/1.5/)
  end
end
