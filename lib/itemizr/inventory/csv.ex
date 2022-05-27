defmodule Itemizr.Inventory.CSV do
  def export(assets, path) do
    assets
    |> Enum.map(fn asset ->
      owner = if asset.owner, do: asset.owner.name, else: "-"
      [asset.id, asset.name, asset.status, owner]
    end)
    |> List.insert_at(0, ~w(id name status owner))
    |> NimbleCSV.RFC4180.dump_to_iodata()
    |> tap(fn csv_data -> File.write!(path, csv_data) end)
  end

  def import(path) do
    path
    |> File.stream!()
    |> NimbleCSV.RFC4180.parse_stream()
    |> Stream.map(fn [id, name, status, owner] ->
      %{
        id: String.to_integer(id),
        name: :binary.copy(name),
        status: String.to_atom(status),
        owner: :binary.copy(owner)
      }
    end)
    |> Enum.to_list()
  end
end
