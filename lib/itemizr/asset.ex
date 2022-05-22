defmodule Itemizr.Asset do
  use Ecto.Schema

  schema "assets" do
    field :name, :string
    field :brand, :string
    field :serial_number, :string
    field :status, Ecto.Enum, values: [available: 1, in_use: 2]
    belongs_to :owner, Itemizr.Owner

    timestamps()
  end
end
