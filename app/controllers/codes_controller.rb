class CodesController < ApplicationController

  http_basic_authenticate_with :name => ENV['EDIT_USER'], :password => ENV['EDIT_PASS']

  def show
    render template: "codes/#{params[:page]}"
  end

end
