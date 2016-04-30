class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  validates :family_name,   presence: true, length: {maximum: 20, message: "は、20文字までで入力して下さい"}
  validates :first_name,    presence: true, length: {maximum: 20, message: "は、20文字までで入力してください"}
  validates :phone_number,  presence: true, format: { with: /0\d{9,10}/i, message: "は、0から始まる10、11桁で入力してください"}
  validates :company_name,  presence: true, length: {maximum: 30, message: "は、30文字までで入力してください"}

  def full_name
    "#{family_name}#{first_name}様"
  end

end
