class AchievementsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_achievement, only: [:update, :show, :destroy]

  # List All Announcement API
  def index
    @achievements = Achievement.all(page).per(per_page)
    render_success 200, true, 'achievements fetched successfully', @achievements.as_json
  end
  
  # Fetch an Announcement API
  def show
    render_success 200, true, 'achievement fetched successfully', @achievement.as_json
  end
  
  # Create an Announcement API
  def create
  @achievement = Achievement.new(achievement_params)
  if @achievement.save && current_user.admin?
    render_success 200, true, 'achievement created successfully', @achievement.as_json
  else
    if @achievement.errors
      errors = achievement.errors.full_messages.join(", ")
    else
      errors = 'achievement creation failed'
    end
    return_error 500, false, 'only admin can create achievements'
    end
  end
  
  # Update an Announcement API
  def update
    if @achievement.update(status_params) && current_user.admin?
      render_success 200, true, 'achievement updated successfully', @achievement.as_json
    else
      if @achievement.errors
        errors = @achievement.errors.full_messages.join(", ")
      else
        errors = 'achievement update failed'
      end
      return_error 500, false, 'only admin can update achievements'
    end
  end
  
  # Delete an Announcement API
  def destroy
    if @achievement.destroy && current_user.admin?
      render_success 200, true, 'achievement deleted successfully', {}
    else
      return_error 500, false, 'only admin can delete achievements'
    end
  end

  private
  # Set Announcements Object, Return Error if not found
  def set_achievement
    @achievement = Achievement.find(params[:id])
    unless @achievement
      return return_error 404, false, 'achievement not found', {}
    end
  end
  
  # Strong parameter for status
  def status_params
    params.require(:achievement).permit(:status)
  end

  # Strong parameters for achievements
  def achievement_params
    params.require(:achievement).permit(:award, :medal, :user_id)
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