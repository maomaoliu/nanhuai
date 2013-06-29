require 'test_helper'

class BaseControllerTest < ActionController::TestCase
  signature ='ac85bc7e9ffc7ec4d680d2a77873b3298694bef8'
  timestamp='1372320936'
  nonce='1372167047'
  echostr = '3434'


  test "should handle nil parameter" do
    get :valid
    assert_response :success
    assert_template :message
    assert_template layout: false
    assert_equal '', assigns[:result]
  end

  test "should handle normal verify request" do
    get :valid, :signature => signature, :timestamp => timestamp, :nonce => nonce, :echostr => echostr
    assert_response :success
    assert_template :message
    assert_template layout: false
    assert_equal echostr, assigns[:result]
  end

end