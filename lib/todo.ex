defmodule Todohub.Todo do
  alias Todohub.Todo
  defstruct [:id, :title, :description, :status, :date_created]

  def new(title, description, status) do
    %Todo{
      id: :erlang.unique_integer([:positive]),
      title: title,
      description: description,
      status: status,
      date_created: DateTime.utc_now()
    }
  end

end
