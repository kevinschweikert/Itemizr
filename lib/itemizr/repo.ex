defmodule Itemizr.Repo do
  use Ecto.Repo,
    otp_app: :itemizr,
    adapter: Ecto.Adapters.SQLite3
end
