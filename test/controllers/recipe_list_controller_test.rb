require "test_helper"

class RecipeListControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get recipe_list_index_url
    assert_response :success
  end
end
