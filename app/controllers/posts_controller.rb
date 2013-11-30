class PostsController < ApplicationController
  before_filter :authenticate_admin_user!, except: %w(index show destroy view search)
  before_filter :load_post, only: %w(destroy edit update show view)

  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
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
  
  def view
   # @comment = @post.comments.build
  end
  
  def destroy
   @post.destroy
   redirect_to :back
  end
  
  def search
    redirect_to root_path if params[:yy].blank? && params[:mm].blank?
    query = []
    query << "(extract(year from created_at) = '#{params[:yy]}')" if params[:yy]
    query << "(extract(month from created_at) = '#{params[:mm]}')" if params[:mm]
    #query << "YEAR(created_at) = '#{params[:yy]}'" if params[:yy]
    #query << "MONTH(created_at) = '#{params[:mm]}'" if params[:mm]
    Rails.logger.debug "\n.......#{query.join(" AND ")}\n"
    @posts = Post.where(query.join(" AND "))
  end
  
  private
  def load_post
    #@post = Post.find(params[:id])
    @post = Post.find_by(title: params[:id].gsub("-", " ").titleize)
  end
  
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
