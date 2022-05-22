defmodule Itemizr.Owner do
  use Ecto.Schema

  schema "owners" do
    field :name, :string
    has_many :assets, Itemizr.Asset
  end
  
end
