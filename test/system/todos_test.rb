require "application_system_test_case"

class TodosTest < ApplicationSystemTestCase
  def todos_title
    all('ul.todo-list label').map(&:text)
  end

  test "visiting the index" do
    visit todos_url
    assert_selector "h1", text: "todos"

    assert_equal [
      'Install Ruby',
      'Learn Rails',
      'Try Hotwire'
    ], todos_title
  end

  test "should create todo" do
    visit todos_url

    fill_in 'todo_title', with: 'Learn Rails test'
    find('#todo_title').native.send_keys(:return)

    assert_selector 'label', text: 'Learn Rails test'
    assert_equal [
      'Install Ruby',
      'Learn Rails',
      'Try Hotwire',
      'Learn Rails test'
    ], todos_title
  end

  # test "should update Todo" do
  #   visit todos_url
  #   click_on "Edit this todo", match: :first

  #   within 'section.main' do
  #     check "Completed"
  #     fill_in "Title", with: "My ToDo"
  #     click_on "Update Todo"
  #   end

  #   assert_text "Todo was successfully updated"
  #   assert_text "Title: My ToDo"
  #   assert_text "Completed: true"
  # end

  test "deleting a todo" do
    visit todos_url

    first('ul.todo-list li').hover
    click_button class: 'destroy'

    assert_no_selector 'label', text: 'Install Ruby'
    assert_equal [
      'Learn Rails',
      'Try Hotwire',
    ], todos_title
  end
end
