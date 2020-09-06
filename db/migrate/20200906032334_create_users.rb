class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :bio
      t.string :name 
      t.string :email
      t.string :password
      t.string :current_coffee_beans
      t.string :coffee_medium
      t.string :profile_img

      t.timestamps
    end
  end
end
