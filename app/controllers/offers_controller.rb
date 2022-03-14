class OffersController < ApplicationController
  before_action :set_offer, only: [:show :edit :update :destroy]

  def index
    @offers = @business.offers
  end

  def generate_offer_json
    filters_query = ''
    search_string = []

    offers = @business.offers
    ## Check if Search Keyword is Present & Write it's Query
    if params.has_key?('search') && params[:search].has_key?('value') && params[:search][:value].present?
      search_columns.each do |term|
        search_string << "#{term} ILIKE :search"
      end
    end

    ## Check for Filters
    if params["filters"].present?
      filters = JSON.parse(params["filters"].gsub("=>", ":").gsub(":nil,", ":null,"))
      filters_query = offers.offer_side_bar_filter(filters)
    end

    offers = offers.where(search_string.join(' OR '), search: "%#{params[:search][:value]}%").where(filters_query)
    offers = offers.order("#{sort_column} #{datatable_sort_direction}") unless sort_column.nil?

    offers = offers.page(datatable_page).per(datatable_per_page)

    render json: {
        offers: offers.as_json(type: 'list'),
        draw: params['draw'].to_i,
        recordsTotal: offers.count,
        recordsFiltered: offers.total_count
    }
  end

  def new
    @offer = @business.offers.new
    @offer_filter = @offer.offer_filters.build
  end

  def create
    @offer = @business.offers.new(offer_params)

    ## Manage offer Tags
    tags_association

    if @offer.save
      redirect_to admin_business_offers_path, success: 'offer successfully created'
    else
      render :new, error: "Error creating offers"
    end
  end

  def edit
    # @offer = @business.offers.find_by(:id => params[:id])
  end

  def update
    respond_to do |format|
      previous_segments = @offer.offer_filters.pluck(:id)
      previous_rules = @offer.offer_rules.pluck(:id)
      removed_segments = previous_segments - @available_segments
      removed_rules = previous_rules - @available_rules

      if @offer.update(offer_params)
        ## Remove Deleted User Segments & offer Rules from a offer
        @offer.offer_filters.where(id: removed_segments).delete_all if removed_segments.present?
        @offer.offer_rules.where(id: removed_rules).delete_all if removed_rules.present?

        format.html { redirect_to admin_business_offers_path(@business), success: 'offer was successfully updated.' }
        format.json { render :edit, status: :updated }
      else
        format.html { render :edit }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @offer = @business.offers.find_by(:id)
    @offer.destroy
    redirect_to :back
  end

  def delete_offer_filter
    # @offer = @business.offer.find_by(:id=>params[:offer_id])
    @offer_filter = offerFilter.find_by(:id => params[:id])
    respond_to do |format|
      if @offer_filter.destroy
        format.html {}
        format.json {}
      else
        flash[:error] = "Post failed to delete."
        format.html {}
        format.json {}
      end
    end
    # @offer_filter.destroy
    # redirect_to edit_business_offer_path(@offer), success: 'Active Segment deleted.'
  end

  private

    def search_columns
      %w(title, description)
    end

    def sort_column
      columns = %w(name start finish)
      columns[params[:order]['0'][:column].to_i - 1]
    end

  ## Set offer
    def set_offer
      @offer = @business.offers.find_by(:id => params[:id]) rescue nil
    end

    def offer_params
      params.require(:offer).permit(:title, :description, :businesses_id)
    end
end
