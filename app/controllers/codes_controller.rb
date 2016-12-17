class CodesController < ApplicationController

  def show
    # if lang_ok?
    # if current_user.study_enabled == true
    # if time_ok?
    render template: "codes/#{params[:page]}"
  end

  def index
  end

end
