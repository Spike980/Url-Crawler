require 'test_helper'

class IndexContentsControllerTest < ActionDispatch::IntegrationTest

  test "should get fetch" do
    get retrieveurl_url
    assert_response :success
  end

end
