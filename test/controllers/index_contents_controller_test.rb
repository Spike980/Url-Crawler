require 'test_helper'

class IndexContentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get index_contents_index_url
    assert_response :success
  end

  test "should get fetch" do
    get index_contents_fetch_url
    assert_response :success
  end

end
