ActiveAdmin.register Teacher do
  index do
    selectable_column
    id_column
    column :name
    column :gender
    column :grade
    column :pod
    column :qualififcation
    column :email
    column :languages_known
    column :avatar
    column :experince
    actions
  end
  form do |f|
    f.inputs do
      f.input :name
      f.input :gender, as: :select, collection: [%w[Male Male], %w[Female Female]]
      f.input :grade, as: :select, collection: (1..5).map { |n| [n.ordinalize, n] }
      f.input :qualififcation
      f.input :email
      f.input :experince
      f.input :languages_known
      f.input :avatar
    end
    f.actions
  end
  permit_params do
    permitted = %i[name qualififcation grade gender email languages_known avatar description experince]
  end
end
