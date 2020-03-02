module Johki
  ID_MAGIC_NUMBER = 76561197960265728.freeze

  def account_id_to_steam_id(account_id)
    account_id + ID_MAGIC_NUMBER
  end

  def steam_id_to_account_id(steam_id)
    steam_id - ID_MAGIC_NUMBER
  end

  def anonymouse?(account_id)
    account_id == 4294967295
  end
end