class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birth_date, presence: true

  has_many :items
  has_many :purchases
  
  with_options presence: true do
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々]/, messages: "全角ひらがな、全角カタカナ、漢字で入力して下さい"}
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥々]/, messages: "全角ひらがな、全角カタカナ、漢字で入力して下さい"}
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナで入力して下さい" }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナで入力して下さい" }
  end
end
