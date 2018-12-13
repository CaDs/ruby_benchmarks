require "roda"

class App < Roda
  plugin :json
  plugin :static_routing

  route do |r|
    r.root do
      response['Content-Type'] = 'application/json'
      "#{Time.now}".to_json
    end
  end
end

run App.freeze.app
