require "application_system_test_case"

class TodosTest < ApplicationSystemTestCase
  def todos_title
    all('ul.todo-list label').map(&:text)
  end

  def completed_todos_title
    all('ul.todo-list li.completed label').map(&:text)
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

  test "creating a todo" do
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

  test "marking a todo as completed or not" do
    visit todos_url

    assert_equal ['Install Ruby'], completed_todos_title

    first('li:not(.completed) input.toggle', visible: false).check

    assert_selector 'li.completed', text: 'Learn Rails'
    assert_equal [
      'Install Ruby',
      'Learn Rails'
    ], completed_todos_title

    first('input.toggle:checked', visible: false).uncheck

    assert_no_selector 'li.completed', text: 'Install Ruby'
    assert_equal ['Learn Rails'], completed_todos_title
  end

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
