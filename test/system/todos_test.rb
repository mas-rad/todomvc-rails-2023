require "application_system_test_case"

class TodosTest < ApplicationSystemTestCase
  setup do
    @todo = todos(:one)
  end

  test "visiting the index" do
    visit todos_url
    assert_selector "h1", text: "todos"
  end

  test "should create todo" do
    visit todos_url

    fill_in 'todo_title', with: 'Learn Rails test'
    find('#todo_title').native.send_keys(:return)

    assert_text "Todo was successfully created"
    assert_text "Title: Learn Rails test"
    assert_text "Completed: false"
  end

  test "should update Todo" do
    visit todos_url
    click_on "Edit this todo", match: :first

    within 'section.main' do
      check "Completed"
      fill_in "Title", with: "My ToDo"
      click_on "Update Todo"
    end

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
