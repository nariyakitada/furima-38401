class User < ApplicationRecord
  has_many :products
  has_many :orders

  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nick_name, presence: true
         validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
         validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
         validates :first_name2, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
         validates :last_name2, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
         validates :birthday, presence: true
         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates :password, format: { with: VALID_PASSWORD_REGEX }
end
