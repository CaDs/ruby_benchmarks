require 'sinatra'
class HelloWorld < Sinatra::Base
  disable :logging
  disable :static
  disable :protection

  get '/' do
    Time.now.to_json
  end
end
# Run with RACK_ENV=production bundle exec puma
