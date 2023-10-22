require "application_system_test_case"

class RootTest < ApplicationSystemTestCase
  test "redirects to /todos" do
    visit '/'
    assert_current_path '/todos'
  end
end
