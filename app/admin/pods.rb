ActiveAdmin.register Pod do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :address, :grade
  #
  # or
  # validates :grade, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }


  
  
  
  permit_params do
    permitted = [:name, :address, :grade, :status, :teacher_id]
    
    # permitted << :other if params[:action] == 'create' && current_user.admin?
    # permitted
  end
end
