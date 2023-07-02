class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

validates :nickname, presence: true, length: { maximum: 40 }
validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]+\z/ }
validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ヶー]+\z/ }
validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ヶー]+\z/ }
validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
validates :birth_date, presence: true
end