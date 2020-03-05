require "test_helper"

class JohkiTest < Minitest::Test
  def setup
    key = ENV["STEAM_API_KEY"]
    if key.nil?
      raise "STEAM_API_KEY environment value is empty!!"
    end
    @client = Johki::Client.new key
    @aoisensi = 76561198049739081
  end

  def test_that_it_has_a_version_number
    refute_nil ::Johki::VERSION
  end

  def test_steam_user_get_player_summaries
    profiles = @client.steam_user.get_player_summaries(steamids: @aoisensi)
    assert_equal profiles[:response][:players][0][:personaname], "aoisensi"
  end

  def test_dota2_match_get_match_details
    match_id = 1697818230 # It's a disastah!
    match = @client.dota2_match.get_match_details(match_id: match_id, include_persona_names: 1)
    player = match[:result][:players][2]
    assert_equal player[:account_id], 87276347
    assert !player[:persona].empty?
  end

  def test_econ_dota2_get_game_items
    heroes = @client.econ_dota2.get_game_items(language: "en")
    assert_equal heroes[:result][:items][0][:localized_name], "Blink Dagger"
  end

  def test_econ_dota2_get_heroes
    heroes = @client.econ_dota2.get_heroes(language: "en")
    assert_equal heroes[:result][:heroes][0][:localized_name], "Anti-Mage"
  end

  def test_steam_id_to_account_id
    id = Johki.steam_id_to_account_id(@aoisensi)
    assert_equal id, 89473353
  end

  def test_dota2_match_get_match_history
    result = @client.dota2_match.get_match_history()[:result]
    assert_equal result[:total_results], 500
  end

  def test_dota2_match_get_match_history_by_sequence_num
    result = @client.dota2_match.get_match_history_by_sequence_num()[:result]
    assert_equal result[:matches].first[:match_id], 496
  end
end
