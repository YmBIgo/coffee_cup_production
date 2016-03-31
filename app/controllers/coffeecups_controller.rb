class CoffeecupsController < ApplicationController

  http_basic_authenticate_with :name => ENV['EDIT_USER'], :password => ENV['EDIT_PASS']

  def show
    render template: "coffeecups/#{params[:page]}"
  end

  def index
  end

end
