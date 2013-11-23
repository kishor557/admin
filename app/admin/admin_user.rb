ActiveAdmin.register AdminUser do
  
  config.batch_actions = true
  
  index do
    selectable_column
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  filter :email
  filter :created_at
    
  form :html => { enctype: "multipart/form-data", multipart: true } do |f|
    f.inputs "Admin Details" do
      f.input :email
      unless f.object.id.nil? || current_admin_user == f.object
        f.input :password
        f.input :password_confirmation
      end
    end
    f.inputs :name => "User Profile", :for => [:profile, f.object.profile || f.object.build_profile] do |pf|
      pf.input :first_name
      pf.input :last_name
      pf.input :gender
      pf.input :occupation
      pf.input :industry
      pf.input :city
      pf.input :state
      pf.input :country
      pf.input :about_me
      pf.input :image, as: :file, label: "Image", hint: (pf.object.image.nil? ? pf.template.content_tag(:span, "No Image Yet") : pf.template.image_tag(pf.object.image.url(:thumb)))
    end
    f.actions
  end
  
 # sidebar "Admin Details" do
 #  attributes_table_for admin_users, :email, :created_at
 # end
 
  controller do
  
   def create
    @user = AdminUser.new(user_params)
    if @user.save
      redirect_to admin_admin_user_path(@user)
    else
      redirect_to :back, alert: "Errors!: #{error_messages_for(@user)}"
    end
   end
  
   def update
    @user = AdminUser.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to admin_admin_user_path(@user)
    else
      redirect_to :back, alert: "Errors!: #{@user.profile.errors.full_messages}"
    end
   end
   
   def error_messages_for(object)
    if object.errors.any?
      err = object.errors.full_messages
      err << object.profile.errors.full_messages if object.profile.errors.any?
      err.join(", ")
    end
   end  
   
    private
    def user_params
      params.require(:admin_user).permit(:email, :password, :password_confirmation, profile_attributes: [:first_name, :last_name, :gender, :occupation, :industry, :city, :state, :country, :about_me, :image])
    end
  end
end
