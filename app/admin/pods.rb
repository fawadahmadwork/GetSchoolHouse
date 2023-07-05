ActiveAdmin.register Pod do
  index do
    selectable_column
    id_column
    column :name
    column :address
    column :grade
    column :teacher
    column :zip_code
    column :status do |pod|
      status_tag pod.active? ? 'Active' : 'Inactive', class: pod.active? ? 'status_tag_active' : 'status_tag_inactive'
    end
    actions
  end
  form do |f|
    f.inputs do
      f.input :name
      f.input :address
      f.input :grade
      f.input :zip_code

      f.input :teacher, as: :select, collection: Teacher.where(grade: f.object.grade)
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :address
      row :grade
      row :zip_code
      row :teacher

      panel 'reviews' do
        table_for pod.reviews do
          column :name
          column :review
        end
      end

      panel 'Childrens in pod' do
        table_for pod.children do
          column :name
          column :age
          column :grade
        end
      end
    end
  end

  permit_params do
    permitted = %i[name address grade status zip_code teacher_id]
  end
end
