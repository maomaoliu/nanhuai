require 'test_helper'

class AuthenticationTest < ActiveSupport::TestCase
  signature ='ac85bc7e9ffc7ec4d680d2a77873b3298694bef8'
  timestamp='1372320936'
  nonce='1372167047'

  test "should verify be failed" do
    assert_equal false, Authentication.verify(signature, timestamp, nonce+'1')
  end

  test "should verify be passed" do
    assert_equal true, Authentication.verify(signature, timestamp, nonce)
  end

end