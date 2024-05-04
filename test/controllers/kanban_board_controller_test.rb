require "test_helper"

class KanbanBoardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get kanban_board_index_url
    assert_response :success
  end

  test "should get new" do
    get kanban_board_new_url
    assert_response :success
  end

  test "should get create" do
    get kanban_board_create_url
    assert_response :success
  end
end
