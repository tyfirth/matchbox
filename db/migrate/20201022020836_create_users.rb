class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name #do these need to be strings? -> t.string "name"
      t.string :email
      t.string :password
    end
  end
end
