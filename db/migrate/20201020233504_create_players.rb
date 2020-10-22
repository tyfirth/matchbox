class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|

      t.string :name
      t.integer :age
      t.string :motto
      t.string :favorite_game
      t.string :win_phrase
      t.string :lose_phrase
    end
  end
end
