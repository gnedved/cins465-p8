class ItemsController < ApplicationController
  # before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  # GET /items
  # GET /items.json
  def index
    @wish_list = WishList.find_by_id(params[:wish_list_id])
    @items = @wish_list.items
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])
  end

  # GET /items/new
  def new
    @wish_list = WishList.find_by_id(params[:wish_list_id])
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    @wish_list = WishList.find_by_id(params[:wish_list_id])
    @item = Item.new(item_params)
    @item.wish_list = @wish_list

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @item }
      else
        format.html { render action: 'new' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @wish_list = WishList.find_by_id(params[:wish_list_id])
      @item = @wish_list.items.find_by_id(params[:id])
      # @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :image, :url, :wish_list_id)
    end
end
