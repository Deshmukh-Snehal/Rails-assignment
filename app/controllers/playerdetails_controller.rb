class PlayerdetailsController < ApplicationController
  before_action :set_playerdetail, only: %i[ show edit update destroy ]

  # GET /playerdetails or /playerdetails.json
  def index
    @playerdetails = Playerdetail.all
  end

  # GET /playerdetails/1 or /playerdetails/1.json
  def show
  end

  # GET /playerdetails/new
  def new
    @playerdetail = Playerdetail.new
  end

  # GET /playerdetails/1/edit
  def edit
  end

  # POST /playerdetails or /playerdetails.json
  def create
    @playerdetail = Playerdetail.new(playerdetail_params)

    respond_to do |format|
      if @playerdetail.save
        format.html { redirect_to playerdetail_url(@playerdetail), notice: "Playerdetail was successfully created." }
        format.json { render :show, status: :created, location: @playerdetail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @playerdetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /playerdetails/1 or /playerdetails/1.json
  def update
    respond_to do |format|
      if @playerdetail.update(playerdetail_params)
        format.html { redirect_to playerdetail_url(@playerdetail), notice: "Playerdetail was successfully updated." }
        format.json { render :show, status: :ok, location: @playerdetail }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @playerdetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /playerdetails/1 or /playerdetails/1.json
  def destroy
    @playerdetail.destroy

    respond_to do |format|
      format.html { redirect_to playerdetails_url, notice: "Playerdetail was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playerdetail
      @playerdetail = Playerdetail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def playerdetail_params
      params.require(:playerdetail).permit(:name, :email, :state, :country, :mobile_no, :gender, :sport_id, :user_id)
    end
end
