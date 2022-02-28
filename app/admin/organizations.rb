ActiveAdmin.register Organization do
  permit_params :name, :city, :state, :country, :services
  form name: 'Organization app' do |f|
    f.inputs 'Organization' do
      f.input :name
      f.input :city
      f.input :state
      f.input :services, as: :quill_editor
    end
    f.actions
 end
  show title: "My Organization" do
    h3 'You have ' + pluralize(organization.products.count, 'product') + ' for this organization'
    organization.products.each do |product|
      div do
        h1 product.name
        h4 link_to "[#{product.id}] : You launch this product on #{product.created_at.strftime('%a %b %e, %Y at %I%M %p')}", admin_product_path(product)
      end
      div(class: 'organization-services') do
        raw organization.services
      end
    end
  end
  index do
    selectable_column 
    column :name
    column :city
    column 'Sevices' do |organization|
      raw organization.services.truncate_words(5)
    end
    column 'View' do |organization|
      link_to 'view', admin_organization_path(organization)
    end
    column 'Edit' do |organization|
      link_to 'edit', edit_admin_organization_path(organization)
    end
    column 'Destroy' do |organization|
      link_to 'destroy', admin_organization_path(organization), method: :delete, data: {confirm: 'Are you sure?'}
    end
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :city, :state, :services
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :city, :state, :services]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end