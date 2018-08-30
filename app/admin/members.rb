ActiveAdmin.register Member do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :roll_no, :first_name, :last_name, :program, :email, :password
  form do |f|
      f.inputs do
        f.input :roll_no
        f.input :first_name
        f.input :last_name
        f.input :program, as: :select, collection: Member::TYPES, include_blank: false
        f.input :email
        f.input :password
      end
      f.actions
    end
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
