class WishListsController < ApplicationController
  # before_action :set_wish_list, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  # GET /wish_lists
  # GET /wish_lists.json
  def index
    @wish_lists = WishList.all
    # @valid_users = ValidAccess.where("wish_list_id = ?", :id)
  end

  def mylists
    @my_lists = WishList.where("user_id = ?", current_user.id)
    # @valid_users = ValidAccess.where("wish_list_id = ?", :id)
  end

=begin  def myrequests
    @my_requests = Request.where("user_id = ? OR user_from_id = ?", current_user.id, current_user.id)

  end
=end

  def refresh
    # @sub_list = WishList.find_all_by_user_id( params[:id]).sort_by{ |k| k['name'] }
  @sub_lists = WishList.find( :all, :conditions => [" uswer_id = ?", params[:id]]  ).sort_by{ |k| k['name'] }    
      respond_to do |format|
        format.json  { render :json => @sub_lists }      
      end

  end


  # GET /wish_lists/1
  # GET /wish_lists/1.json
  def show
  end

  # GET /wish_lists/new
  def new
    @wish_list = WishList.new
    @wish_list.user_id = current_user.id
    # @wish_list.user = current_user
    # @valid_users = ValidAccess.where("wish_list_id = ?", :id)
  end

  # GET /wish_lists/1/edit
  def edit
  end

  # POST /wish_lists
  # POST /wish_lists.json
  def create
    @wish_list = WishList.new(wish_list_params)
    @wish_list.user_id = current_user.id
    # @valid_users = ValidAccess.where("wish_list_id = ?", :id)

    respond_to do |format|
      if @wish_list.save
        format.html { redirect_to root_url, notice: 'Wish list was successfully created.' }
        format.json { render action: 'show', status: :created, location: @wish_list }
      else
        format.html { render action: 'new' }
        format.json { render json: @wish_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wish_lists/1
  # PATCH/PUT /wish_lists/1.json
  def update
    respond_to do |format|
      if @wish_list.update(wish_list_params)
        format.html { redirect_to @wish_list, notice: 'Wish list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @wish_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wish_lists/1
  # DELETE /wish_lists/1.json
  def destroy
    @wish_list.destroy
    respond_to do |format|
      format.html { redirect_to wish_lists_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wish_list
      @wish_list = WishList.find(params[:id])
      # @valid_users = ValidAccess.where("wish_list_id = ?", :id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wish_list_params
      params.require(:wish_list).permit(:name, :privacy, :user_id)
    end
end
