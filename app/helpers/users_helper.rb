module UsersHelper
  def gravatar_for(user, options = { size: 80 })
    
    # Gravatorの画像取得用URLを作成
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    
    # imgタグに画像を設定
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end 
  
  # 地域リストの取得
  def area_list
    return  {東京: "東京", 大阪: "大阪", 名古屋: "名古屋", 福岡: "福岡",
    札幌: "札幌", 広島: "広島", 仙台: "仙台", 新潟: "新潟", その他: "その他"}
  end
  
end