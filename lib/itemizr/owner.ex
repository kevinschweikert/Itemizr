defmodule Itemizr.Owner do
  
  use Ecto.Schema
  import Ecto.Changeset

  schema "owners" do
    field :name, :string
    has_many :assets, Itemizr.Asset
  end

  def changeset(owner, params \\ %{}) do
    owner
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
