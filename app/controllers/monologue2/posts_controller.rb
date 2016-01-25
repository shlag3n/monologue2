class Monologue2::PostsController < Monologue2::ApplicationController
  def index
    @page = params[:page].nil? ? 1 : params[:page]
    @posts = Monologue2::Post.page(@page).includes(:user).published
  end

  def show
    if monologue_current_user
      @post = Monologue2::Post.default.where("url = :url", {url: params[:post_url]}).first
    else
      @post = Monologue2::Post.published.where("url = :url", {url: params[:post_url]}).first
    end
    if @post.nil?
      not_found
    end
  end

  def feed
    @posts = Monologue2::Post.published.limit(25)
  end
end
