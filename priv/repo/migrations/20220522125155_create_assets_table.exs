defmodule Itemizr.Repo.Migrations.CreateAssetsTable do
  use Ecto.Migration

  def change do
    create table("assets") do
      add :name, :string, null: false
      add :brand, :string
      add :serial_number, :string
      add :status, :integer
      add :owner_id, references(:owners)

      timestamps()
    end

  end
end
