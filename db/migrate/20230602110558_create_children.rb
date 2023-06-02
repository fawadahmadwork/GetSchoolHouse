class CreateChildren < ActiveRecord::Migration[7.0]
  def change
    create_table :children do |t|
      t.string :name
      t.integer :age
      t.string :grade
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
