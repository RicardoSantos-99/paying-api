defmodule PayingWeb.WelcomeController do
  use PayingWeb, :controller

  def index(conn, _params) do
    text(conn, "Hello, world!")
  end
end
