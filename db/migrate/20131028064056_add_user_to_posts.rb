class AddUserToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :admin_user_id, :integer, after: :id
  end
end
