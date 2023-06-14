class CreatePodRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :pod_requests do |t|
      t.references :child, null: false, foreign_key: true
      t.references :pod, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
