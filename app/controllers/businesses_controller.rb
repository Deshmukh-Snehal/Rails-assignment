class BusinessesController < ApplicationController
  before_action :set_business, only: %i[ show edit update destroy ]

  # GET /businesses or /businesses.json
  def index
    @businesses = Business.all
    respond_to do |format|
      format.html
      format.csv { send_data @businesses.to_csv(['name', 'address', 'start_date', 'end_date']) }
    end
  end

  def import
    Business.import(params[:file])
    redirect_to businesses_path, notice: "File imported Sucessfully."
  end

  # def get_dataset
  #   render json: { businesses: Business.page(params[:page]).per(per_page) }
  # end
  
  def fetch_businesses
    # binding.pry
    businesses = Business.all
    search_string = []
    filter_query = ''

    ## Check if Search Keyword is Present & Write it's Query
    if params.has_key?('search') && params[:search].has_key?('value') && params[:search][:value].present?
      search_columns.each do |term|
        search_string << "#{term} ILIKE :search"
      end
      businesses = businesses.where(search_string.join(' OR '), search: "%#{params[:search][:value]}%")
    end

    if params["filters"].present?
      filters = JSON.parse(params["filters"].gsub("=>", ":").gsub(":nil,", ":null,"))
      businesses = businesses.business_side_bar_filter(filters)
    end

    businesses = businesses.order("#{sort_column} #{datatable_sort_direction}") unless sort_column.nil?
    businesses = businesses.page(datatable_page).per(datatable_per_page)

    render json: {
        businesses: businesses.as_json,
        draw: params['draw'].to_i,
        recordsTotal: businesses.count,
        recordsFiltered: businesses.total_count,
    }
  end

  # GET /businesses/1 or /businesses/1.json
  def show
  end

  # GET /businesses/new
  def new
    @business = Business.new
  end

  # GET /businesses/1/edit
  def edit
  end

  # POST /businesses or /businesses.json
  def create
    @business = Business.new(business_params)

    respond_to do |format|
      if @business.save
        format.html { redirect_to business_url(@business), notice: "business was successfully created." }
        format.json { render :show, status: :created, location: @business }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /businesses/1 or /businesses/1.json
  def update
    respond_to do |format|
      if @business.update(business_params)
        format.html { redirect_to business_url(@business), notice: "business was successfully updated." }
        format.json { render :show, status: :ok, location: @business }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /businesses/1 or /businesses/1.json
  def destroy
    @business.destroy

    respond_to do |format|
      format.html { redirect_to businesses_url, notice: "business was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  ## Datatable Column List om which search can be performed
  def search_columns
    %w(name address)
  end

  ## Datatable Column List on which sorting can be performed
  def sort_column
    columns = %w(name address start_date end_date created_at)
    columns[params[:order]['0'][:column].to_i - 1]
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_business
      @business = Business.find(params[:id])
    rescue ActiveRecord::RecordNotFound =>error
      redirect_to businesses_path, notice: "Sorry record is not their"
    end

    # Only allow a list of trusted parameters through.
    def business_params
      params.require(:business).permit(:name, :address, :start_date, :end_date)
    end
end