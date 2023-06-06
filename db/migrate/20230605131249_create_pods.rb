class CreatePods < ActiveRecord::Migration[7.0]
  def change
    create_table :pods do |t|
      t.string :name
      t.string :address
      t.string :grade

      t.timestamps
    end
  end
end
