class CodesController < ApplicationController

  # http_basic_authenticate_with :name => ENV['EDIT_USER'], :password => ENV['EDIT_PASS']

  before_action :authenticate_user!

  def show
    if current_user.study_enabled == true
      render template: "codes/#{params[:page]}"
    else
      redirect_to "/dashboard"
      flash[:alert] = "閲覧権限がありません"
    end
  end
  def index
    if current_user.study_enabled == true
    else
      redirect_to "/dashboard"
      flash[:alert] = "閲覧権限がありません"
    end
  end

end
