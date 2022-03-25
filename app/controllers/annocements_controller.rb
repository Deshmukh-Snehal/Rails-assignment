class AnnocementsController < ApplicationController
  before_action :get_sport
  # before_action :authenticate_user!, except: [:index, :show ]
  before_action :set_annocement, only: %i[ show edit update destroy ]
  # before_action :authenticate_user!, except: [:index, :show ]
  # before_action :correct_user, only: [:edit, :update, :destroy ]
  # GET /annocements or /annocements.json
  def index
    @annocements = @sport.annocements
  end

  # GET /annocements/1 or /annocements/1.json
  def show
  end

  # GET /annocements/new
  def new
    @annocement = @sport.annocements.build
    # @annocement = current_user.annocements.build
  end

  # GET /annocements/1/edit
  def edit
  end

  #  /annocements or /annocements.json
  def create
    @annocement = @sport.annocements.build(annocement_params)
    # @annocement = current_user.annocements.build(annocement_params)
    respond_to do |format|
      if @annocement.save
        AnnounceMailer.Announcement_created.deliver_later
        format.html { redirect_to sport_annocements_path(@sport), notice: "Annocement was successfully created." }
        format.json { render :show, status: :created, location: @annocement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @annocement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /annocements/1 or /annocements/1.json
  def update
    respond_to do |format|
      if @annocement.update(annocement_params)
        format.html { redirect_to sport_annocement_path(@sport), notice: "Annocement was successfully updated." }
        format.json { render :show, status: :ok, location: @annocement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @annocement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /annocements/1 or /annocements/1.json
  def destroy
    @annocement.destroy

    respond_to do |format|
      format.html { redirect_to sport_annocements_path(@sport), notice: "Annocement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # def correct_user
  #   @annocement = current_user.annocements.find_by(id: params[:id])
  #   redirect_to annocements_path, notice: "Unauthorized to edit this player" if @annocement.nil?
  # end

  private
    def get_sport
      @sport = Sport.find(params[:sport_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_annocement
      @annocement = @sport.annocements.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def annocement_params
      params.require(:annocement).permit(:title, :sport_id, :user_id)
    end
end
