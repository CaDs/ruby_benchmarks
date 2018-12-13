class AppController < ApplicationController
  def index
    render json: Time.now.to_json
  end
end

# Run with RAILS_ENV=production r s -p 9292
