require 'test_helper'

class StateCodesControllerTest < ActionController::TestCase
  test "should get update_code_res_json" do
    get :update_code_res_json
    assert_response :success
  end

end
