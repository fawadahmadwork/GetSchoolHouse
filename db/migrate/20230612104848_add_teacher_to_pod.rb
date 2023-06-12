class AddTeacherToPod < ActiveRecord::Migration[7.0]
  def change
      add_reference :pods, :teacher, foreign_key: true, optional: true
  end
end
