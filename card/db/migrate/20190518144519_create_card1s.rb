class CreateCard1s < ActiveRecord::Migration[5.2]
  def change
    create_table :card1s do |t|
      t.text :title
      t.text :author
      t.integer :price
      t.text :publisher
      t.text :memo

      t.timestamps
    end
  end
end
