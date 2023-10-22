require "application_system_test_case"

class TodosTest < ApplicationSystemTestCase
  setup do
    @todo = todos(:one)
  end

  test "visiting the index" do
    visit todos_url
    assert_selector "h1", text: "Todos"
  end

  test "should create todo" do
    visit todos_url
    click_on "New todo"

    check "Completed"
    fill_in "Title", with: "My todo"
    click_on "Create Todo"

    assert_text "Todo was successfully created"
    assert_text "Title: My todo"
    assert_text "Completed: true"
  end

  test "should update Todo" do
    visit todos_url
    click_on "Edit this todo", match: :first

    check "Completed"
    fill_in "Title", with: "My ToDo"
    click_on "Update Todo"

    assert_text "Todo was successfully updated"
    assert_text "Title: My ToDo"
    assert_text "Completed: true"
  end

  test "should destroy Todo" do
    visit todos_url
    click_on "Destroy this todo", match: :first

    assert_text "Todo was successfully destroyed"
  end
end
