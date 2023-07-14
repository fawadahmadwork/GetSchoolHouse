class AddColumnToPod < ActiveRecord::Migration[7.0]
  def change
    add_column :pods, :image_url, :string
  end
end
