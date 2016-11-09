class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]
  skip_before_action :check_app_auth, only: [:show, :index, :new, :create]
  # skip_before_filter :require_login, :only => [:index, :new, :create, :show]


  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end


  def index
    @line_items = LineItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @line_items }
    end
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
    if !@current_user.try(:is_admin?)
      redirect_to new_user_path, notice:"Вы не админинстратор"
    end
  end

  # POST /line_items
  # POST /line_items.json
  # def create
  #   @line_item = LineItem.new(line_item_params)
  #
  #   respond_to do |format|
  #     if @line_item.save
  #       format.html { redirect_to @line_item, notice: 'Корзина создана.' }
  #       format.json { render :show, status: :created, location: @line_item }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @line_item.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  #
  ###
  ######
  ##########

  def create
    case params[:place]
      when nil
        @product = Product.find(params[:product_id])
        @line_item.add_item(@product)
        respond_to do |format|
          format.html{redirect_to products_path, notice: 'Книга добавлена в корзину.'}
          format.js{}
        end
      # when "cart"
      #   set_line_item
      #   @line_item.quantity+=1
      #   @line_item.save
      #   respond_to do |format|
      #     format.html{redirect_to @cart, notice: 'Книга добавлена в корзину.'}
      #     format.js{}
      #   end
      when "line_items"
        set_line_item
        @line_item.quantity+=1
        @line_item.save
        respond_to do |format|
          format.html{redirect_to line_items_path, notice: 'Книга добавлена в корзину'}
          format.js{}
        end
      when "show"
        set_line_item
        @line_item.quantity+=1
        @line_item.save
        respond_to do |format|
          format.html{redirect_to product_path(@line_item.product), notice: 'Книга добавлена в корзину'}
          format.js{}
        end
    end
  end

  ###########
  ######
  ###
  #

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  # def destroy
  #   @line_item.destroy
  #   respond_to do |format|
  #     format.html { redirect_to line_items_url, notice: 'Line item was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end
  def destroy
    @line_item.destroy
    redirect_to root_path, notice: 'Корзина очищена.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:Product_id, :price, :quantity)
    end
end
