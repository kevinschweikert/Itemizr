defmodule Itemizr.Repo.Migrations.CreateOwnersTable do
  use Ecto.Migration

  def change do
    create table("owners") do
      add :name, :string
    end
  end
end
