ActiveAdmin.register Organization do
  permit_params :name, :city, :state, :country, :services
  show name: "My Product" do
    h3 'You have ' + pluralize(organization.products.count, 'product') + ' for this organization'
    organization.products.each do |product|
      div do
        h1 product.name
        h4 link_to "[#{product.id}] : You launch this product on #{product.created_at.strftime('%a %b %e, %Y at %I%M %p')}", admin_product_path(product)
      end
    end
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :city, :state, :country, :services
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :city, :state, :country, :services]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
