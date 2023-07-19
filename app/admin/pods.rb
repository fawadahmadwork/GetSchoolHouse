ActiveAdmin.register Pod do
  index do
    selectable_column
    id_column
    column :name
    column :image_url
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
      f.input :image_url
      f.input :zip_code
      f.input :grade, as: :select, collection: (1..5).map { |n| [n.ordinalize, n] }
      f.input :teacher, as: :select,
                        collection: Teacher.includes(:pod).where(pods: { teacher_id: nil }, grade: f.object.grade)
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
          column :name do |review|
            link_to review.name, admin_review_path(review)
          end
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
  controller do
    def update
      params[:pod][:teacher_id] = resource.teacher_id if params[:pod][:teacher_id].blank?
      super
    end
  end

  permit_params do
    permitted = %i[name image_url address grade status zip_code teacher_id]
  end
end
