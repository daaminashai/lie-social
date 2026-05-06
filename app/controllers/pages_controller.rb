class PagesController < ApplicationController
  def home
    @posts = Post.recent.limit(10)
    @posts_count = Post.count
    @users_count = User.count
  end
end
