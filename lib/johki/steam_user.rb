require "johki/client"
require "johki/interface"

module Johki
  class ISteamUser < Interface
    def initialize(client)
      super(client, "ISteamUser")
    end

    def get_player_summaries(params={})
      path = path("GetPlayerSummaries/v2")
      @client.get(path, params)
    end
  end
end