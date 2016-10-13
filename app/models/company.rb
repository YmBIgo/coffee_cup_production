class Company < ActiveRecord::Base

  belongs_to :user

  def picture_url?
    if self.picture_url != nil
      return true
    else
      return false
    end
  end

end
