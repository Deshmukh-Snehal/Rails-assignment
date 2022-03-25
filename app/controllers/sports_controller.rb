class SportsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show ]
  before_action :set_sport, only: %i[ show edit update destroy ]

  # GET /sports or /sports.json
  def index
    # WelcomeMailPlayerJob.perform_later 1,2,3
    @sports = Sport.all
  end

  # GET /sports/1 or /sports/1.json
  def show
  end

  # GET /sports/new
  def new
    @sport = Sport.new
  end

  # GET /sports/1/edit
  def edit
  end

  # POST /sports or /sports.json
  def create
    @sport = Sport.new(sport_params)

    respond_to do |format|
      if @sport.save
        format.html { redirect_to sport_url(@sport), notice: "Sport was successfully created." }
        format.json { render :show, status: :created, location: @sport }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sport.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sports/1 or /sports/1.json
  def update
    respond_to do |format|
      if @sport.update(sport_params)
        format.html { redirect_to sport_url(@sport), notice: "Sport was successfully updated." }
        format.json { render :show, status: :ok, location: @sport }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sport.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sports/1 or /sports/1.json
  def destroy
    @sport.destroy

    respond_to do |format|
      format.html { redirect_to sports_url, notice: "Sport was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  # def get_dataset
  #   render json: { sports: Sport.page(params[:page]).per(per_page) }  
  # end

  def get_processed_dataset
    # binding.pry
    sports = Sport.all
    search_string = []
    filter_query = ''

    ## Check if Search Keyword is Present & Write it's Query
    if params.has_key?('search') && params[:search].has_key?('value') && params[:search][:value].present?
      search_columns.each do |term|
        search_string << "#{term} ILIKE :search"
      end
      sports = sports.where(search_string.join(' OR '), search: "%#{params[:search][:value]}%")
    end

    if params["filters"].present?
      filters = JSON.parse(params["filters"].gsub("=>", ":").gsub(":nil,", ":null,"))
      
    end

    sports = sports.order("#{sort_column} #{datatable_sort_direction}") unless sort_column.nil?
    sports = sports.page(datatable_page).per(datatable_per_page)

    render json: {
        sports: sports.as_json,
        draw: params['draw'].to_i,
        recordsTotal: sports.count,
        recordsFiltered: sports.total_count,
    }
  end

  def search_columns
    %w(sport_name sport_equipments)
  end

  ## Datatable Column List on which sorting can be performed
  def sort_column
    columns = %w(sport_name sport_equipments created_at)
    columns[params[:order]['0'][:column].to_i - 1]
  end

  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sport
      @sport = Sport.find(params[:id])
    rescue ActiveRecord::RecordNotFound =>error
      redirect_to sports_path, notice: "Sorry record is not their"
    end

    # Only allow a list of trusted parameters through.
    def sport_params
      params.require(:sport).permit(:sport_name, :sport_equipments, :sport_id, :user_id)
    end
end