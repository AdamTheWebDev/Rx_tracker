require 'test_helper'

class RxImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rx_images_index_url
    assert_response :success
  end

end
