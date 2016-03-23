class CodesController < ApplicationController

  def show
    render template: "codes/#{params[:page]}"
  end

end
