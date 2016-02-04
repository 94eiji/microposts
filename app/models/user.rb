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

  # 地域に対するバリデーション                    
  validates :area, presence: true, length: { minimum: 1, maximum: 16 }

  # 1 : n = user : microposts
  has_many :microposts 
  
  # 1 : n = 1user : followerの人数分
  has_many :following_relationships, class_name: "Relationship",
                                     foreign_key: "follower_id",
                                     dependent: :destroy
  
  # follower_relationshipsのfollower_idと一致するUser                                   
  has_many :following_users, through: :following_relationships,
                              source: :followed
                              
  # 1 : n = 1user : follered_idと一致するUser
  has_many :follower_relationships, class_name:  "Relationship",
                                    foreign_key: "followed_id",
                                    dependent:   :destroy
                                    
  # follwer_relationshipsのfollwer_idと一致するfollower_usersのid                   
  has_many :follower_users, through: :follower_relationships,
                             source: :follower                              

  #パスワードのハッシュ化
  has_secure_password
  
  # 他のユーザをフォローする
  def follow(other_user)
    
    # データがあれば1件返す、なければ登録する
    following_relationships.find_or_create_by(followed_id: other_user.id)
  end
  
  # フォロー中のユーザをアンフォローする
  def unfollow(other_user)
    following_relationship = following_relationships.find_by(followed_id: other_user.id)
    following_relationship.destroy if following_relationship
  end
  
  # 特定ユーザをフォロー中か？
  def following?(other_user)
    following_users.include?(other_user)
  end
end
