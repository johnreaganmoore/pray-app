class PostsController < ApplicationController

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to home_path }
        format.json { render action: 'show', status: :created, location: @post }
        format.js { render layout: false }
      else
         format.html { redirect_to home_path }
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id)
  end

end
