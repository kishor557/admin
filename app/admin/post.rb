ActiveAdmin.register Post do
  index do
    column :title
    column :content
    column "Posted Date", :created_at

    default_actions
  end
 
 #form :partial => "form" 
  
  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
     f.input :admin_user_id, as: :hidden, value: current_admin_user.id
     f.input :title 
     f.input :content, :as => :ckeditor
    end
    f.actions
  end
  
  controller do
    def update
     @post = Post.find(params[:id])
     if @post.update_attributes(post_params)
        redirect_to admin_post_path(@post)
      else
        render 'edit'
      end
    end
  
    def create
      @post = Post.new(post_params)
      if @post.save
        redirect_to admin_posts_path
      else
        render 'new'
      end
    end
  
    private 
    def post_params
      params.require(:post).permit(:title, :content, :admin_user_id)
    end
 end
end
