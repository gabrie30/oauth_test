defmodule Catcasts.Authentication.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Catcasts.Authentication.User


  schema "authentication_users" do
     field :first_name, :string
     field :last_name, :string
     field :email, :string
     field :provider, :string
     field :token, :string
    timestamps()
  end

  @doc false
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:first_name, :last_name, :email, :provider, :token])
  end
end
