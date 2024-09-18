defmodule Todohub do
  def add_todo(title, description, status \\ false) do
    Todohub.Todo.new(title, description, status)
  end

  def list_todo(todos) do
    Enum.map(todos, &"Title: #{&1.title} status: #{&1.status}")
  end

  def mark_todo_complete(todos, todo_id) do
    case is_todo_available(todos, todo_id) do
      nil ->
        {:error, "Não existe este todo"}

      todo ->
        updated_todo = %{todo | status: true}
        todo_update(todos, updated_todo, todo_id)
    end
  end

  defp todo_update(todos, update_todo, todo_id) do
    Enum.map(todos, fn todo ->
      if todo.id == todo_id do
        update_todo
      else
        todo
      end
    end)
  end

  defp is_todo_available(todos, todo_id) do
    Enum.find(todos, fn todo -> todo.id == todo_id end)
  end

  def remove_task(todos, todo_id) do
   update_todo = Enum.reject(todos, fn todo -> todo.id == todo_id end)
   verification_remove_todo(todos, update_todo)
  end

  defp verification_remove_todo(todos, update_todo) do
    if(length(update_todo) == length(todos)) do
      {:error, "Nenhum tarefa com esse ID foi encontrada"}
    else
      {:ok, update_todo}
    end
  end
end
