require 'spec_helper'

describe "old_games/edit" do
  before(:each) do
    @old_game = assign(:old_game, stub_model(OldGame,
      :game_id => 1
    ))
  end

  it "renders the edit old_game form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", old_game_path(@old_game), "post" do
      assert_select "input#old_game_game_id[name=?]", "old_game[game_id]"
    end
  end
end
