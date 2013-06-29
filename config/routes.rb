Weixin::Application.routes.draw do
  get '' => 'base#valid'
  post '' => 'base#receive'
end
