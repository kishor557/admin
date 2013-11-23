class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :admin_user
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :occupation
      t.string :industry
      t.string :city
      t.string :state
      t.string :country
      t.text :about_me
      t.integer :views, null: false, default: 0
      
      t.timestamps
    end
  end
end
