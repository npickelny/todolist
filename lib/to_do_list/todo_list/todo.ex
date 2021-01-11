defmodule ToDoList.TodoList.Todo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "todos" do
    field :completed, :boolean, default: false
    field :description, :string, default: "mock"
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(todo, attrs) do
    todo
    |> cast(attrs, [:title, :description, :completed])
    |> validate_required([:title])
  end
end
