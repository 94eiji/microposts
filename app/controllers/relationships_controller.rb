class RelationshipsController < ApplicationController
  
  before_action :logged_in_user
  
  # 他のユーザをフォローする
  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
  end

  # フロー中のユーザをアンフォローする
  def destroy
    @user = current_user.following_relationships.find(params[:id]).followed
    current_user.unfollow(@user)
  end
end
