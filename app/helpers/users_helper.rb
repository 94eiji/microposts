module UsersHelper
  def gravatar_for(user, options = { size: 80 })
    
    # Gravatorの画像取得用URLを作成
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    
    # imgタグに画像を設定
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end 
end