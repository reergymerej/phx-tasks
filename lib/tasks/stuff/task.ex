defmodule Tasks.Stuff.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :details, :string
    field :done, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:details, :done])
    |> validate_required([:details, :done])
  end
end
