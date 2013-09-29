require 'spec_helper'

describe "old_games/new" do
  before(:each) do
    assign(:old_game, stub_model(OldGame,
      :game_id => 1
    ).as_new_record)
  end

  it "renders new old_game form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", old_games_path, "post" do
      assert_select "input#old_game_game_id[name=?]", "old_game[game_id]"
    end
  end
end
