defmodule Itemizr.Asset do
  use Ecto.Schema
  import Ecto.Changeset

  schema "assets" do
    field :name, :string
    field :brand, :string
    field :serial_number, :string
    field :status, Ecto.Enum, values: [available: 1, in_use: 2], default: :available
    belongs_to :owner, Itemizr.Owner, on_replace: :update

    timestamps()
  end

  def changeset(asset, params \\ %{}) do
    asset
    |> cast(params, [:name, :brand, :serial_number, :status, :owner_id])
    |> cast_assoc(:owner, with: &Itemizr.Owner.changeset/2)
    #|> assoc_constraint(:owner)
    |> validate_required([:name])
    |> validate_inclusion(:status, [:available, :in_use])
  end
end
