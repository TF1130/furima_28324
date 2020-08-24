class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :password, presence: true, length: { minimum: 6 },
                       format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/ }
  validates :password_confirm, confirmation: true, presence: true
  validates :family_name, :first_name, presence: true,
                                       format: { with: /\A[ぁ-んァ-ンー-龥]+\z/ }
  validates :family_name_kana, :first_name_kana, presence: true,
                                                 format: { with: /\A[ァ-ン]+\z/ }
  validates :date_select, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  has_many :items
  has_many :comments
  has_many :item_purchases
end
