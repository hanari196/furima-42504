class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items
  has_many :orders

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  validates :password,
            format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[!-~]+\z/,
                      message: 'は英字と数字の両方を含めて設定してください' }

  validates :last_name, :first_name,
            presence: true,
            format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角で入力してください' }

  validates :last_name_kana, :first_name_kana,
            presence: true,
            format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力してください' }

  validates :birth_day, presence: true
end
