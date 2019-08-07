class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable,
         omniauth_providers: [:facebook, :google_oauth2]

  validates :nickname, :family_name,:family_name_kana,:first_name,:first_name_kana,:birthday_year,:birthday_month,:birthday_day,presence: true;


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.avatar = auth.info.image
      user.nickname = auth.info.name
      user.birthday_year = 2019
      user.birthday_month = 01
      user.birthday_day = 01
      user.first_name = auth.extra.raw_info.first_name
      binding.pry
      user.first_name_kana = "a"
      user.family_name = "a"
      user.family_name_kana = "a"
    end
  end

end
