require "johki/client"
require "johki/interface"

module Johki
  class IEconDota2 < Interface
    def initialize(client, appid)
      super(client, "IEconDota2_#{appid}")
    end

    def get_game_items(params={})
      path = path("GetGameItems/v1")
      @client.get(path, params)
    end

    def get_heroes(params={})
      path = path("GetHeroes/v1")
      @client.get(path, params)
    end
  end
end