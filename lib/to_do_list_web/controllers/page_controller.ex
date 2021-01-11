defmodule ToDoListWeb.PageController do
  use ToDoListWeb, :controller

  def index(conn, _params) do
    redirect(conn, to: "/todos")
  end
end
