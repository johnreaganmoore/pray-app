class PostsController < ApplicationController

  def index
    posts = Post.all

    render json: posts
  end

  def create
    @post = Post.new(post_params)

    coords = Geocoder.coordinates(request.remote_ip)

    @post.lat = coords[0].to_f
    @post.lng = coords[1].to_f

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
