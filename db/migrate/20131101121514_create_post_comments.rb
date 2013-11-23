class CreatePostComments < ActiveRecord::Migration
  def change
    create_table :post_comments do |t|
      t.references :post
      t.references :follower
      t.text :text
      t.string :type
      t.timestamps
    end
  end
end
