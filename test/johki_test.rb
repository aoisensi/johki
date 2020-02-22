require "test_helper"

class JohkiTest < Minitest::Test
  def setup
    @client = Johki::Client.new ENV["STEAM_API_KEY"]
    @aoisensi = 76561198049739081
  end

  def test_steam_api_key_env_is_set
    assert ENV["STEAM_API_KEY"] != ""
  end

  def test_that_it_has_a_version_number
    refute_nil ::Johki::VERSION
  end

  def test_steam_user_get_player_summaries
    profiles = @client.steam_user.get_player_summaries(steamids: @aoisensi)
    assert_equal profiles[:response][:players][0][:personaname], "aoisensi"
  end

  def test_dota2_match_get_match_details
    match = @client.dota2_match.get_match_details(match_id: 1697818230) # It's a disastah!
    assert_equal  match[:result][:players][2][:account_id], 87276347
  end
end
