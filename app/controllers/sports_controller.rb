class SportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sport, only: [:update, :show, :destroy]

  # List All Sport API
  def index
    @sports = Sport.all(page).per(per_page)
    render_success 200, true, 'Sports fetched successfully', @sports.as_json
  end

  # Fetch an Sport API
  def show
    render_success 200, true, 'Sport fetched successfully', @sport.as_json
  end

  # Create an Sport API
  def create
    @sport = Sport.new(sport_params)

    if @sport.save && current_user.admin?
      render_success 200, true, 'Sport created successfully', @sport.as_json  
    else
      if @sport.errors
        errors = @sport.errors.full_messages.join(", ")
      else
        errors = 'Sport creation failed'
      end
      return_error 500, false, 'only admin can create sport'
    end
  end

  # Update an Sport API
  def update
    if @sport.update(sport_params) && current_user.admin?
      render_success 200, true, 'Sport updated successfully', @sport.as_json
    else
      if @sport.errors
        errors = @sport.errors.full_messages.join(", ")
      else
        errors = 'Sport update failed'
      end
      return_error 500, false, 'only admin can update sport'
    end
  end
  
  # Delete an Sport API
  def destroy
    if @sport.destroy && current_user.admin?
      render_success 200, true, 'Sport deleted successfully', {}
    else
      return_error 500, false, 'only admin can delete sport'
    end
  end

  private
  # Set Sport Object, Return Error if not found
  def set_sport
    @sport = Sport.find(params[:id])
    unless @sport
      return return_error 404, false, 'Sport not found', {}
    end
  end

  # Strong parameters of Sport
  def sport_params
    params.require(:sport).permit(:name, :equipments)
  end
    
  # Kaminari Pagination method
  def page
    @page ||= params[:page] || 1
  end
  # Kaminari Pagination method for per page
  def per_pag
    @per_page ||= params[:per_page] || 10
  end
end