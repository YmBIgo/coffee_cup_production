module UsersHelper

  def user_studiable?
    current_user.study_enabled?
  end

end
