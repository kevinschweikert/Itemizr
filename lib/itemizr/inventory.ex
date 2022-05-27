defmodule Itemizr.Inventory do
  alias Itemizr.Owner
  alias Itemizr.Asset
  alias Itemizr.Repo

  def create_owner(name) do
    %Owner{}
    |> Owner.changeset(%{name: name})
    |> Repo.insert()
  end

  def get_owner(id) do
    Owner
    |> Repo.get(id)
    |> Repo.preload(:assets)
  end

  def get_owners() do
    Owner
    |> Repo.all()
    |> Repo.preload(:assets)
  end

  def update_owner(%Owner{} = owner, params) do
    owner
    |> Owner.changeset(params)
    |> Repo.update()
  end

  def delete_owner(%Owner{} = owner) do
    Repo.delete(owner)
  end

  def create_asset(name) do
    %Asset{}
    |> Asset.changeset(%{name: name})
    |> Repo.insert()
  end

  def get_asset(id) do
    Asset
    |> Repo.get(id)
    |> Repo.preload(:owner)
  end

  def get_assets() do
    Asset
    |> Repo.all()
    |> Repo.preload(:owner)
  end

  def delete_asset(asset) do
    Repo.delete(asset)
  end

  def update_asset(asset, params) do
    asset
    |> Asset.changeset(params)
    |> Repo.update()
  end
end
