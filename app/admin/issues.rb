ActiveAdmin.register Issue do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#  id          :bigint(8)        not null, primary key
#  book_id     :integer
#  member_id   :integer
#  issue_date  :date
#  due_date    :date
#  fine        :integer
#  return_date :date

#  permit_params :book_id, :member_id
#  form do |f|
#      f.inputs do
#        f.input :book_id
#        f.input :member_id
#      end
#      f.actions
#    end


    actions :index, :show

  show do
    attributes_table do
      row :id
      row :book_id
      row :member_id
      row :issue_date
      row :due_date
      row :fine
      row :return_date
      row :created_at
      row :updated_at
    end
  end
#    panel 'Issues', only: :show do
#      paginated_collection(issue.order_items.order('created_at DESC').page(params[:page]).per(10), download_links: false) do
#        table_for collection do
#          column :id
#          column :memebr
#          column :book
#          column :issue_date
#        end
#      end
#    end


#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
