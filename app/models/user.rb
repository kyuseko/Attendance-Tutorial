class User < ApplicationRecord
  before_save { self.email = email.downcase } #大文字は小文字にする
  
  
  validates :name,  presence: true, length: { maximum: 50 } #存在性、最大５０文字まで
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i #正規表現によるメールアドレスのフォーマット
  validates :email, presence: true, length: { maximum: 100 }, #存在性、最大１００文字まで
                    format: { with: VALID_EMAIL_REGEX }, 
                    uniqueness: true  #一意である事同じ物がないか 
  has_secure_password #文字列をハッシュ化
  validates :password, presence: true, length: { minimum: 6 } #存在性、最小６文字から
end
