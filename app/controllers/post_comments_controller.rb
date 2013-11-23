class PostCommentsController < ApplicationController
  before_filter :authenticate_follower!, except: %w(show index new create)
  before_filter :load_post
  before_filter :load_comment, only: %w(destroy edit update show view)

  def index
    @comments = @post.comments
  end
  
  def new
    @comment = @post.comments.build
  end
  
  def create
    redirect_to new_follower_session_path if params[:post_comment][:type] != "Anonymous"
    @comment = @post.comments.new(post_params)
    if @comment.save
      redirect_to :back
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @post.update_attributes(post_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end
  
  def show
  end
  
  def destroy
  end
  
  private
  def load_post
    @post = Post.find(params[:post_id])
  end

  def load_comment
    @comment = PostComment.find(params[:id])
  end
  
  def post_params
    params.require(:post_comment).permit(:text, :follower_id, :type)
  end
end
