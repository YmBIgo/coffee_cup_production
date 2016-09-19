class CoffeecupsController < ApplicationController

  # http_basic_authenticate_with :name => ENV['EDIT_USER'], :password => ENV['EDIT_PASS']

  before_action :authenticate_user!, :only => [:show], :if => :lang_ok?

  def show
    if lang_ok?
      if current_user.study_enabled == true
        render template: "coffeecups/#{params[:page]}"
      else
        redirect_to dashboard_path
        flash[:alert] = "閲覧権限がありません"
      end
    else
      render template: "coffeecups/#{params[:page]}"
    end
  end

  def index
  end

  private
  # If locale is zh-TW return true
  def lang_ok?
    if I18n.locale == :"zh-TW" || :"zh-CN"
      return false
    else
      return true
    end
  end

end
