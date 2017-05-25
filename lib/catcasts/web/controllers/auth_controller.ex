defmodule Catcasts.Web.AuthController do
  use Catcasts.Web, :controller
  plug Ueberauth
  require IEx

  alias Catcasts.Authentication.User

  def new(%{assigns: %{ueberauth_auth: auth}} = conn, params) do
    # IO.inspect auth
    # IEx.pry
    user_params = %{token: auth.credentials.token, first_name: auth.info.first_name, last_name: auth.info.last_name, email: auth.info.email, provider: "google"}
    changeset = User.changeset(%User{}, user_params)

    create(conn, changeset)
  end

  def create(conn, changeset) do
    case insert_or_update_user(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Thank you for signing in!")
        |> put_session(:user_id, user.id)
        |> redirect(to: "/")
      {:error, _reason} ->
        conn
        |> put_flash(:error, "Error signing in")
        |> redirect("/")
    end
  end

  defp insert_or_update_user(changeset) do
    # IEx.pry
    # IO.inspect changeset
    case Catcasts.Repo.get_by(User, email: changeset.changes.email) do
      nil ->
        Catcasts.Repo.insert(changeset)
      user ->
        {:ok, user}
    end
  end
end
