class CreateCanditates < ActiveRecord::Migration[6.1]
  def change
    create_table :canditates do |t|
      t.string :name
      t.integer :votes

      t.timestamps
    end
  end
end
