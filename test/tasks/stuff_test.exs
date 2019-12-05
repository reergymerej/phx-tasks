defmodule Tasks.StuffTest do
  use Tasks.DataCase

  alias Tasks.Stuff

  describe "tasks" do
    alias Tasks.Stuff.Task

    @valid_attrs %{details: "some details", done: true}
    @update_attrs %{details: "some updated details", done: false}
    @invalid_attrs %{details: nil, done: nil}

    def task_fixture(attrs \\ %{}) do
      {:ok, task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Stuff.create_task()

      task
    end

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Stuff.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Stuff.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = Stuff.create_task(@valid_attrs)
      assert task.details == "some details"
      assert task.done == true
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Stuff.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, %Task{} = task} = Stuff.update_task(task, @update_attrs)
      assert task.details == "some updated details"
      assert task.done == false
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Stuff.update_task(task, @invalid_attrs)
      assert task == Stuff.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Stuff.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Stuff.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Stuff.change_task(task)
    end
  end
end
