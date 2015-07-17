class StaticPagesController < ApplicationController
  def home
    @micropost = current_user.microposts.build if signed_in?
    @feed_items = current_user.feed
    @professions = current_user.professions
  end

  def help
  end

  def abou
  end
end
