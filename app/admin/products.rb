ActiveAdmin.register Product do
  permit_params :name, :cost, :organization_id
   form name: 'Products app' do |f|
      f.inputs 'Product' do
        f.input :organization
        f.input :name
        f.input :cost
      end
      f.actions
   end
  index do
    selectable_column 
    column :name
    column :cost
    column 'View' do |product|
      link_to 'view', admin_product_path(product)
    end
    column 'Edit' do |product|
      link_to 'edit', edit_admin_product_path(product)
    end
    column 'Destroy' do |product|
      link_to 'destroy', admin_product_path(product), method: :delete, data: {confirm: 'Are you sure?'}
    end
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :cost, :organization_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :cost, :organization_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
