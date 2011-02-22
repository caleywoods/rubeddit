require 'test_helper'

class LinksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
