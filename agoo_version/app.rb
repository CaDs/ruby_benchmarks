require 'agoo'
require 'json'

Agoo::Server.init(9292, 'root')

class MyHandler
  def call(req)
    [ 200, { }, [ Time.now.to_json ] ]
  end
end

handler = MyHandler.new
Agoo::Server.handle(:GET, "/", handler)
Agoo::Server.start()
