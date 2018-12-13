PadrinoVersion::App.controllers :site do

  get :index, :map => '/' do
    Time.now.to_json
  end
end
