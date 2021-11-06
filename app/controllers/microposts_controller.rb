#class MicropostsController
class MicropostsController < ApplicationController
  before_action :set_micropost, only: %i[show edit update destroy vote]

  def index
    if current_user.admin?
      set_meta_tags site: 'Post all'
      @microposts = Micropost.all
    else
      set_meta_tags site: 'Post all user'
      @microposts = Micropost.where(user_id: current_user.id)
    end
  end

  def vote
    if current_user.voted_up_on? @micropost
      @micropost.unvote_by current_user 
    else
      @micropost.upvote_by current_user
    end
    render "vote.js.erb"
    
  end

  def yourvote
     post = []
    all = Vote.all.pluck(:voter_id, :votable_id)
    all.map do|voter, votable| 
      if voter == current_user.id
        post << votable
      end
    end
    @microposts = Micropost.where(id: post)
  end
  
  def home
    tops = Vote.all.pluck(:votable_id)
    main = tops.max_by {|i| tops.count(i)}
    @top = Micropost.where(id: main)
    @microposts = Micropost.all
    
  end
  
  def show
    set_meta_tags site: 'Show post'
   
  end

  def new
    set_meta_tags site: 'Create post'
    @micropost = Micropost.new
  end

  def edit
    set_meta_tags site: 'Edit post'
  end

  def create
    set_meta_tags site: 'Create post'
    @micropost = current_user.microposts.create(micropost_params)
    respond_to do |format|
      if @micropost.save
        format.html { redirect_to @micropost, notice: 'Micropost was successfully created.' }
        format.json { render :show, status: :ok, location: @micropost }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @micropost.update(micropost_params)
        format.html { redirect_to @micropost, notice: 'Micropost was successfully updated.' }
        format.json { render :show, status: :ok, location: @micropost }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @micropost.destroy
    respond_to do |format|
      format.html { redirect_to microposts_url, notice: 'Micropost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  

  private

  def set_micropost
    @micropost = Micropost.find(params[:id])
  end

  def micropost_params
    params.require(:micropost).permit(:content, :context, :cover_picture)
  end
end
