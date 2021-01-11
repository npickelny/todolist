defmodule ToDoListWeb.TodoController do
  use ToDoListWeb, :controller

  alias ToDoList.TodoList
  alias ToDoList.TodoList.Todo

  def index(conn, _params) do
    todos = TodoList.list_todos()
    changeset = TodoList.change_todo(%Todo{})
    render(conn, "index.html", todos: todos, changeset: changeset)
  end

  def new(conn, _params) do
    changeset = TodoList.change_todo(%Todo{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"todo" => todo_params}) do
    IO.puts "Creating"
    case TodoList.create_todo(todo_params) do
      {:ok, todo} ->
        conn
        |> put_flash(:info, "Todo created successfully.")
        |> redirect(to: Routes.todo_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        IO.puts "Hello World"
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    todo = TodoList.get_todo!(id)
    render(conn, "show.html", todo: todo)
  end

  def edit(conn, %{"id" => id}) do
    todo = TodoList.get_todo!(id)
    changeset = TodoList.change_todo(todo)
    render(conn, "edit.html", todo: todo, changeset: changeset)
  end

  def update(conn, %{"id" => id, "todo" => todo_params}) do
    todo = TodoList.get_todo!(id)

    case TodoList.update_todo(todo, todo_params) do
      {:ok, todo} ->
        conn
        |> put_flash(:info, "Todo updated successfully.")
        |> redirect(to: Routes.todo_path(conn, :show, todo))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", todo: todo, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    todo = TodoList.get_todo!(id)
    {:ok, _todo} = TodoList.delete_todo(todo)

    conn
    |> put_flash(:info, "Todo deleted successfully.")
    |> redirect(to: Routes.todo_path(conn, :index))
  end

  def toggle_status(todo) do
    IO.puts todo.completed
    IO.puts '00000000000'
    case todo.completed do
      true -> false
      false -> true
    end
  end

  def toggle(conn, %{"id" => id}) do
    todo = TodoList.get_todo!(id)
    TodoList.update_todo(todo, %{completed: toggle_status(todo)})
    redirect(conn, to: Routes.todo_path(conn, :index))
  end

end
