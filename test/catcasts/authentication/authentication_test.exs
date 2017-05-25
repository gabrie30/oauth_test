# defmodule Catcasts.AuthenticationTest do
#   use Catcasts.DataCase

#   alias Catcasts.Authentication

#   describe "users" do
#     alias Catcasts.Authentication.User

#     @valid_attrs %{}
#     @update_attrs %{}
#     @invalid_attrs %{}

#     def user_fixture(attrs \\ %{}) do
#       {:ok, user} =
#         attrs
#         |> Enum.into(@valid_attrs)
#         |> Authentication.create_user()

#       user
#     end

#     test "list_users/0 returns all users" do
#       user = user_fixture()
#       assert Authentication.list_users() == [user]
#     end

#     test "get_user!/1 returns the user with given id" do
#       user = user_fixture()
#       assert Authentication.get_user!(user.id) == user
#     end

#     test "create_user/1 with valid data creates a user" do
#       assert {:ok, %User{} = user} = Authentication.create_user(@valid_attrs)
#     end

#     test "create_user/1 with invalid data returns error changeset" do
#       assert {:error, %Ecto.Changeset{}} = Authentication.create_user(@invalid_attrs)
#     end

#     test "update_user/2 with valid data updates the user" do
#       user = user_fixture()
#       assert {:ok, user} = Authentication.update_user(user, @update_attrs)
#       assert %User{} = user
#     end

#     test "update_user/2 with invalid data returns error changeset" do
#       user = user_fixture()
#       assert {:error, %Ecto.Changeset{}} = Authentication.update_user(user, @invalid_attrs)
#       assert user == Authentication.get_user!(user.id)
#     end

#     test "delete_user/1 deletes the user" do
#       user = user_fixture()
#       assert {:ok, %User{}} = Authentication.delete_user(user)
#       assert_raise Ecto.NoResultsError, fn -> Authentication.get_user!(user.id) end
#     end

#     test "change_user/1 returns a user changeset" do
#       user = user_fixture()
#       assert %Ecto.Changeset{} = Authentication.change_user(user)
#     end
#   end
# end

defmodule Catcasts.UserTest do
  use Catcasts.DataCase
  alias Catcasts.Authentication.User

  @valid_attrs %{token: "fahoifhaoaew0rheh0", email: "batman@example.com",
                 first_name: "Bruce", last_name: "Wayne", provider: "google"}
  @invalid_attrs %{}

  test "changeset with valide attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  # test "changeset with invalid attributes" do
  #   changeset = User.changeset(%User{}, @invalid_attrs)
  #   refute changeset.valid?
  # end
end
