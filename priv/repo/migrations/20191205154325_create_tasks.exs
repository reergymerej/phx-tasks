defmodule Tasks.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :details, :string
      add :done, :boolean, default: false, null: false

      timestamps()
    end

  end
end
