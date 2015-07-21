class MicropostsController < ApplicationController
  before_action :signed_in_user

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      #@professions = current_user.professions
      #@feed_items = current_user.feed
      #render 'static_pages/home' #これだとエラーになる
      flash[:error] = "Anything wrong!"
      redirect_to root_url
    end
  end

  def destroy
  end

    private
      def micropost_params
        params.require(:micropost).permit(:content)
      end
end
