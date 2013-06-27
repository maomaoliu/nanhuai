class BaseController < ApplicationController
  def valid
    signature = params['signature'] || ''
    timestamp = params['timestamp'] || ''
    nonce = params['nonce'] || ''
    echostr = params['echostr'] || ''

    @result = Authentication.verify(signature, timestamp, nonce) ? echostr : ''
    render :file => 'valid', :layout => false
  end
end