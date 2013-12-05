class ValidAccessesController < ApplicationController
#  before_action :set_valid_access, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  # GET /valid_accesses
  # GET /valid_accesses.json
  def index
    @wish_list = WishList.find_by_id(params[:wish_list_id])
    # @valid_accesses = ValidAccess.all
    @valid_accesses = @wish_list.valid_accesses
  end

  # GET /valid_accesses/1
  # GET /valid_accesses/1.json
  def show
    @valid_access = ValidAccess.find(params[:id])
  end

  # GET /valid_accesses/new
  def new
    @wish_list = WishList.find_by_id(params[:wish_list_id])
    @valid_access = ValidAccess.new
  end

  # GET /valid_accesses/1/edit
  def edit
    @valid_access = ValidAccess.find(params[:id])
  end

  # POST /valid_accesses
  # POST /valid_accesses.json
  def create
    @wish_list = WishList.find_by_id(params[:wish_list_id])
    @valid_access = ValidAccess.new(valid_access_params)
    @valid_access.wish_list = @wish_list

    respond_to do |format|
      if @valid_access.save
        format.html { redirect_to @valid_access, notice: 'Valid access was successfully created.' }
        format.json { render action: 'show', status: :created, location: @valid_access }
      else
        format.html { render action: 'new' }
        format.json { render json: @valid_access.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /valid_accesses/1
  # PATCH/PUT /valid_accesses/1.json
  def update
    respond_to do |format|
      if @valid_access.update(valid_access_params)
        format.html { redirect_to @valid_access, notice: 'Valid access was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @valid_access.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /valid_accesses/1
  # DELETE /valid_accesses/1.json
  def destroy
    @valid_access.destroy
    respond_to do |format|
      format.html { redirect_to valid_accesses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_valid_access
      @wish_list = WishList.find_by_id(params[:wish_list_id])
      # @valid_access = ValidAccess.find(params[:id])
      @valid_access = @wish_list.valid_acesses.find_by_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def valid_access_params
      params.require(:valid_access).permit(:wish_list_id, :user_id)
    end
end
