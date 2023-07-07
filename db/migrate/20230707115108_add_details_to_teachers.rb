class AddDetailsToTeachers < ActiveRecord::Migration[7.0]
  def change
    add_column :teachers, :gender, :string
    add_column :teachers, :experince, :string
    add_column :teachers, :description, :string
    add_column :teachers, :avatar, :string
    add_column :teachers, :languages_known, :string
    add_column :teachers, :email, :string
  end
end
