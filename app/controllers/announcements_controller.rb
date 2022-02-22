class AnnouncementsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sport
  before_action :set_announcement, only: [:update, :show, :destroy]
  
  # This action fetch all the announcements of sport
  def index   
    @announcements = @sport.announcements(page).per(per_page)
    render_success 200, true, 'announcements fetched successfully', @announcements.as_json
  end

  # this action lets us create a new announcement
  def create
    @announcement = @sport.announcements.new(announcement_params)
    if @announcement.save && current_user.admin?
      render_success 200, true, 'announcement created successfully', @announcement.as_json
    else
      if @announcement.errors
        errors = @announcement.errors.full_messages.join(", ")
      else
        errors = 'announcement creation failed'
      end
      return_error 500, false, 'only admin can create announcements'
    end
  end

  # Update announcement API
  def update
    if @announcement.update(announcement_params) && current_user.admin?
      render_success 200, true, 'announcement updated successfully', @announcement.as_json
    else
      if @announcement.errors
        errors = @announcement.errors.full_messages.join(", ")
      else
        errors = 'announcement update failed'
      end
      return_error 500, false, 'only admin can update announcements'
    end
  end

  # Fetch an announcement API
  def show
    render_success 200, true, 'announcement fetched successfully', @announcement.as_json
  end

  # Delete an announcement API
  def destroy
    if @announcement.destroy && current_user.admin?
      render_success 200, true, 'announcement deleted successfully', {}
    else
      return_error 500, false, 'only admin can delete announcement'
    end
  end
  private
  def set_sport
    @sport = Sport.where(id: params[:sport_id]).first    
      unless @sport
          return return_error 404, false, 'Sport not found', {}
      end
  end

  # Strong Params of announcement
  def announcement_params
    params.require(:announcement).permit(:title,:description,:image,:sport_id,:user_id)
  end

  ## Set announcement Object, Return Error if not found
  def set_announcement
    @announcement = @sport.announcements.where(id: params[:id]).first
    unless @announcement
      return return_error 404, false, 'announcement not found', {}
    end
  end
  
  # Pagination
  def page
    @page ||= params[:page] || 1
  end
  
  def per_pag
    @per_page ||= params[:per_page] || 10
  end
end
