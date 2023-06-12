ActiveAdmin.register Teacher do
  index do
    selectable_column
    id_column
    column :name
    column :qualififcation
    column :grade
    column :pod
    actions
  end
  
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :qualififcation, :grade
  # 
  # or
  # has_one :pod
  permit_params do
    permitted = [:name, :qualififcation, :grade]
    #   permitted << :other if params[:action] == 'create' && current_user.admin?
    #   permitted
  end
  end
