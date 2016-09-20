class CodesController < ApplicationController

  # http_basic_authenticate_with :name => ENV['EDIT_USER'], :password => ENV['EDIT_PASS']

  before_action :authenticate_user!, :if => :lang_ok?

  def show
    if lang_ok?
      if current_user.study_enabled == true
        render template: "codes/#{params[:page]}"
      else
        redirect_to dashboard_path
        flash[:alert] = "閲覧権限がありません"
      end
    else
      render template: "codes/#{params[:page]}"
    end
  end

  def index
    if lang_ok?
      if current_user.study_enabled == true
      else
        redirect_to dashboard_path
        flash[:alert] = "閲覧権限がありません"
      end
    end
  end

  private
  # If locale is zh-TW || zh-CN return true
  def lang_ok?
    if I18n.locale == :ja
      return true
    else
      return false
    end
  end

end
