class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :password, :password_confirm,
            :family_name, :first_name, :family_name_kana,
            :first_name_kana, :date_select, :email, presence: true
end