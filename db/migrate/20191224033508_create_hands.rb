class CreateHands < ActiveRecord::Migration[6.0]
  def change
    create_table :hands do |t|
      t.string :cards
      t.string :result

      t.timestamps
    end
  end
end
