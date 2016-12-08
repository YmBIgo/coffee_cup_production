class PagesController < ApplicationController

  # http_basic_authenticate_with :name => ENV['EDIT_USER'], :password => ENV['EDIT_PASS']

  before_action :authenticate_user!, :only => [:show]

  def show
    # if lang_ok?
    # if current_user.study_enabled == true
    # if time_ok?
    render template: "pages/#{params[:page]}"
  end

  def index
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

  def time_ok?

    # current time
    if Rails.env.production?
      current_time_hour = (Time.now.strftime("%H").to_i)+9
    else
      current_time_hour = (Time.now.strftime("%H").to_i)
    end

    # start time
    start_time_hour = current_user.start_time.strftime("%H").to_i

    # end time
    end_time_hour = current_user.end_time.strftime("%H").to_i
    if end_time_hour == 0
      end_time_hour = 24
    end

    # check time
    if current_time_hour >= start_time_hour && current_time_hour < end_time_hour
      return true
    else
      return false
    end

  end

end
