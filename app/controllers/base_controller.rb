class BaseController < ApplicationController

  def valid
    echostr = params['echostr'] || ''

    @result = verify ? echostr : ''
    render :file => 'valid', :layout => false
  end

  def receive
    if verify
      @result = MessageHandler.handle(XMLMessage.new(request.raw_post))
    else
      @result = ''
    end

    render :file => 'message', :layout => false
  end

  private
  def verify
    signature = params['signature'] || ''
    timestamp = params['timestamp'] || ''
    nonce = params['nonce'] || ''
    Authentication.verify(signature, timestamp, nonce)
  end
end