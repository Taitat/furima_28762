class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,}\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
  
  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  validates_format_of :last_name, with: NAME_REGEX
  validates_format_of :first_name, with: NAME_REGEX
  NAME_KANA_REGEX = /\A[ァ-ン]+\z/.freeze
  validates_format_of :last_name_kana, with: NAME_KANA_REGEX
  validates_format_of :first_name_kana, with: NAME_KANA_REGEX
  EMAIL_REGEX = /.+@.+/.freeze
  validates_format_of :email, with: EMAIL_REGEX

end
