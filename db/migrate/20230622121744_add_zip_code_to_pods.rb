class AddZipCodeToPods < ActiveRecord::Migration[7.0]
  def change
    add_column :pods, :zip_code, :string
  end
end
