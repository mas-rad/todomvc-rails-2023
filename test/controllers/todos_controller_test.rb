require "test_helper"

class TodosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @todo = todos(:one)
  end

  test "should get index" do
    get todos_url
    assert_response :success
  end

  test "get new should raise" do
    assert_raises NameError do
      get new_todo_url
    end
  end

  test "should create todo" do
    assert_difference("Todo.count") do
      post todos_url, params: { todo: { completed: @todo.completed, title: @todo.title } }
    end

    assert_redirected_to todos_url
  end

  test "should get edit" do
    get edit_todo_url(@todo)
    assert_response :success
  end

  test "should update todo" do
    patch todo_url(@todo), params: { todo: { completed: @todo.completed, title: @todo.title } }
    assert_redirected_to todos_url
  end

  test "should toggle all todos" do
    assert_difference('Todo.completed.count', 2) do
      patch toggle_todos_url
    end
    assert_redirected_to todos_url

    assert_difference('Todo.completed.count', -3) do
      patch toggle_todos_url
    end
    assert_redirected_to todos_url
  end

  test "should destroy todo" do
    assert_difference("Todo.count", -1) do
      delete todo_url(@todo)
    end

    assert_redirected_to todos_url
  end

  test "should destroy all completed todos" do
    todos(:two).update!(completed: true)

    assert_difference('Todo.completed.count', -2) do
      delete completed_todos_url
    end

    assert_redirected_to todos_url
  end
end
