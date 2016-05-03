class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :family_name,   presence: true, length: {maximum: 20, message: "は、20文字までで入力して下さい"}
  validates :first_name,    presence: true, length: {maximum: 20, message: "は、20文字までで入力して下さい"}
  validates :phone_number,  presence: true, format: { with: /0\d{9,10}/i, message: "は、0から始まる10、11桁で入力して下さい"}
  validates :company_name,  presence: true, length: {maximum: 30, message: "は、30文字までで入力して下さい"}
  validates :sex, presence: true
  validates :prefecture, presence: true, length: {maximum: 4, message: "4文字までで入力して下さい"}
  validates :agreement, :acceptance => true

  def full_name
    "#{family_name}#{first_name}様"
  end

  def sex_list
    {1 => '男性', 2 => '女性'}
  end

  def sex_name
    self.sex_list[self.sex] || ''
  end

  def limit_time
    if self.study_limit_at?
      l = self.study_limit_at
      limit_datetime = l.strftime("%Y年%m月%d日24時")
      return limit_datetime
    else
      return "教材を購入して下さい"
    end
  end

  def time_left
    if self.study_limit_at?
      l = self.study_limit_at
      limit_day = Date.new(l.year, l.month, l.day)
      l_t = (limit_day - Date.today).to_i
      return l_t
    else
      return 0
    end
  end

end
