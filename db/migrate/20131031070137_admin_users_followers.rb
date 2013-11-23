class AdminUsersFollowers < ActiveRecord::Migration
  def up
    create_table :admin_users_followers, :id => false do |t|
      t.integer :admin_user_id
      t.integer :follower_id
    end
  end
  def down
    drop_table :admin_users_followers
  end
end
