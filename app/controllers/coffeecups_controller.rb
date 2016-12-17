class CoffeecupsController < ApplicationController

  def show
    render template: "coffeecups/#{params[:page]}"
  end

  def index
  end

end
