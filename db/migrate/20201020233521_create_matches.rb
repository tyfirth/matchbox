class CreateMatches < ActiveRecord::Migration[5.2]
  def change

    create_table :matches do |t|

      t.string :name
      t.string :winner
      t.integer :score

      t.integer :player_id

      t.timestamps 
    end
  end
end
