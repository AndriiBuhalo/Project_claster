class MicropostsController < ApplicationController
  before_action :set_micropost, only: %i[ show edit update destroy ]

  # GET /microposts or /microposts.json
  def index
    if current_user.admin?
      set_meta_tags site: 'Post all' 
      @microposts = Micropost.all
    else
      set_meta_tags site: 'Post all' 
      @microposts = Micropost.where(user_id: current_user.id)
    end
  end

  

  # GET /microposts/1 or /microposts/1.json
  def show
    set_meta_tags site: 'Show post' 
  end

  # GET /microposts/new
  def new
    set_meta_tags site: 'Create post' 
    @micropost = Micropost.new
  end

  # GET /microposts/1/edit
  def edit
    set_meta_tags site: 'Edit post' 
  end

  # POST /microposts or /microposts.json
  def create
    set_meta_tags site: 'Create post' 
    @micropost = Micropost.new(micropost_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @micropost.save
        format.html { redirect_to @micropost, notice: "Micropost was successfully created." }
        format.json { render :show, status: :created, location: @micropost }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /microposts/1 or /microposts/1.json
  def update
    respond_to do |format|
      if @micropost.update(micropost_params)
        format.html { redirect_to @micropost, notice: "Micropost was successfully updated." }
        format.json { render :show, status: :ok, location: @micropost }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /microposts/1 or /microposts/1.json
  def destroy
    @micropost.destroy
    respond_to do |format|
      format.html { redirect_to microposts_url, notice: "Micropost was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_micropost
      # if Micropost.admin?
      #   @microposts = Micropost.all
      # else
      @micropost = Micropost.find(params[:id])
      # end
    end


    # Only allow a list of trusted parameters through.
    def micropost_params
      params.require(:micropost).permit(:content, :user_id)
    end
end
