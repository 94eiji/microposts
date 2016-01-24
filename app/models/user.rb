class User < ActiveRecord::Base
  
  before_save {
    # 代入前に小文字に変換
    self.email = email.downcase
  }
  
  # 名前に対するバリデーション
  
  validates :name, presence: true, length: { maximum: 50 }
  
  # メールアドレスに対するバリデーション
  ## 255文字以内、メールアドレスの形式
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  #パスワードのハッシュ化
  has_secure_password
end
