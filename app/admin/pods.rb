ActiveAdmin.register Pod do
  index do
    selectable_column
    id_column
    column :name
    column :address
    column :grade
    column :teacher
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
      f.input :teacher, as: :select, collection: Teacher.where(grade: f.object.grade)
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :address
      row :grade
      row :teacher
      # other attributes of the Pod
    
      # Custom panel to display children
      panel 'Childrens in pod' do
        table_for pod.children do
          column :name
          column :age
          column :grade
          # Add more columns as needed
        end
      end
    end
  end
  permit_params do
    permitted = [:name, :address, :grade, :status, :teacher_id]
  end
end

