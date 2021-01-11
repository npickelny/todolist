defmodule ToDoListWeb.TodoView do
  use ToDoListWeb, :view

  def completed(todo) do
    case todo.completed do
      true -> "completed"
      _ -> ""
    end
  end
end
