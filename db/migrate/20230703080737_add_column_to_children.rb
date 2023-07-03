class AddColumnToChildren < ActiveRecord::Migration[7.0]
  def change
    add_column :children, :gender, :string
    add_column :children, :parent_name, :string
    add_column :children, :address, :string
    add_column :children, :contact, :integer
  end
end
