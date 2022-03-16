class OffersController < ApplicationController
  before_action :set_business
  before_action :set_offer
  
  def index
    if params[:offer] and params[:offer][:business_id]
      @offers = Offer.search(params[:offer][:business_id])
    else
      @offers = Offer.all
    end
  end

  def generate_offer_json
    filters_query = ''
    search_string = []
    response = []

    offers =Offer.all
    businesses =Business.all
    ## Check if Search Keyword is Present & Write it's Query
    if params.has_key?('search') && params[:search].has_key?('value') && params[:search][:value].present?
      search_columns.each do |term|
        search_string << "#{term} ILIKE :search"
      end
    end

    ## Check for Filters
    if params["filters"].present?
      filters = JSON.parse(params["filters"].gsub("=>", ":").gsub(":nil,", ":null,"))
      offers = offers.where(business_id: filters['business_id']) if filters['business_id'].present?
    end

    offers = offers.where(search_string.join(' OR '), search: "%#{params[:search][:value]}%").where(filters_query)
    offers = offers.order("#{sort_column} #{datatable_sort_direction}") unless sort_column.nil?
    offers = offers.page(datatable_page).per(datatable_per_page)
      
      render json: {
          offers: offers.as_json,
          draw: params['draw'].to_i,
          recordsTotal: offers.count,
          recordsFiltered: offers.total_count,
      }
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)

    respond_to do |format|
      if @offer.save
        format.html { redirect_to offers_path(@offer), notice: "offer was successfully created." }
        format.json { render :show, status: :created, location: @offer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    # @offer = @business.offers.find_by(:id => params[:id])
  end

  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to offer_path(@offer), notice: "offer was successfully updated." }
        format.json { render :show, status: :ok, location: @offer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @offer.destroy

    respond_to do |format|
      format.html { redirect_to offers_path, notice: "offer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def search_columns
    %w(title description)
  end

  def sort_column
    columns = %w(title description start_date end_date)
    columns[params[:order]['0'][:column].to_i - 1]
  end

  def set_business 
    @business = Business.find_by(:name => params[:name])
  end
  
  # Use callbacks to share common setup or constraints between actions.
  def set_offer
    @offer = Offer.find_by(:id => params[:id])
  end

  def offer_params
    # offer[:business] = offer.businesses.to_json(:only => [:title, :description, :start_date, :end_date, :name,])
    params.require(:offer).permit(:title, :description, :start_date, :end_date, :business_id)
  end
end