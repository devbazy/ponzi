require 'spec_helper'

describe "old_games/show" do
  before(:each) do
    @old_game = assign(:old_game, stub_model(OldGame,
      :game_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
