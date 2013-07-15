class BaseController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:valid, :receive]

  def valid
    echostr = params['echostr'] || ''
    render text: (verify ? echostr : '')
  end

  def receive
    render text: (verify ? MessageHandler.handle(XMLMessage.new(request.raw_post)) : '')
  end

  private
  def verify
    signature = params['signature'] || ''
    timestamp = params['timestamp'] || ''
    nonce = params['nonce'] || ''
    Authentication.verify(signature, timestamp, nonce)
  end
end