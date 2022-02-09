class TagInfosController < ApplicationController
  before_action :set_tag_info, only: %i[ show edit update destroy ]

  # GET /tag_infos or /tag_infos.json
  def index
    @tag_infos = TagInfo.all
  end

  # GET /tag_infos/1 or /tag_infos/1.json
  def show
  end

  # GET /tag_infos/new
  def new
    @tag_info = TagInfo.new
  end

  # GET /tag_infos/1/edit
  def edit
  end

  # POST /tag_infos or /tag_infos.json
  def create
    @tag_info = TagInfo.new(tag_info_params)

    respond_to do |format|
      if @tag_info.save
        format.html { redirect_to tag_info_url(@tag_info), notice: "Tag info was successfully created." }
        format.json { render :show, status: :created, location: @tag_info }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tag_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tag_infos/1 or /tag_infos/1.json
  def update
    respond_to do |format|
      if @tag_info.update(tag_info_params)
        format.html { redirect_to tag_info_url(@tag_info), notice: "Tag info was successfully updated." }
        format.json { render :show, status: :ok, location: @tag_info }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tag_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tag_infos/1 or /tag_infos/1.json
  def destroy
    @tag_info.destroy

    respond_to do |format|
      format.html { redirect_to tag_infos_url, notice: "Tag info was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag_info
      @tag_info = TagInfo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tag_info_params
      params.require(:tag_info).permit(:title, :player, :post, :player_id, :post_id)
    end
end
