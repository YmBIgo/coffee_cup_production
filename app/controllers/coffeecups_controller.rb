class CoffeecupsController < ApplicationController

  # http_basic_authenticate_with :name => ENV['EDIT_USER'], :password => ENV['EDIT_PASS']
  before_action :authenticate_user!, :only => [:show]

  def show
    unless I18n.locale == :"zh-TW"
      if current_user.study_enabled == true
        render template: "coffeecups/#{params[:page]}"
      else
        redirect_to dashboard_path
        flash[:alert] = "閲覧権限がありません"
      end
    end
  end

  def index
  end

end
