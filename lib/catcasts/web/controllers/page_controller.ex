defmodule Catcasts.Web.PageController do
  use Catcasts.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
