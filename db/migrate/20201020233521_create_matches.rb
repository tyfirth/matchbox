class CreateMatches < ActiveRecord::Migration[5.2]
  def change

    create_table :matches do |t|

      t.string :name
      t.string :winner
      t.integer :score

      t.integer :player_id

      t.timestamps #I want to access this and use it as a name for each matches
    #match.id.name -> Catan.2.name = "Catan - Monday, October 19, 2020"
    end
  end
end
