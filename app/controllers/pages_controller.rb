class PagesController < ApplicationController

  # http_basic_authenticate_with :name => ENV['EDIT_USER'], :password => ENV['EDIT_PASS']

  before_action :authenticate_user!, :only => [:show]

  def show
    if current_user.study_enabled == true
      render template: "pages/#{params[:page]}"
    else
      redirect_to dashboard_path
      flash[:alert] = "閲覧権限がありません"
    end
  end

  def index
  end

end
