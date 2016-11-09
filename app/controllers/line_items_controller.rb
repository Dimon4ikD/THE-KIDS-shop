class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:show, :edit, :update, :destroy, :plus_minus]
  skip_before_action :check_app_auth, only: [:show, :index, :new, :create, :destroy, :plus_minus]
  # skip_before_filter :require_login, :only => [:index, :new, :create, :show]


  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = @cart.line_items.all

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
    # case params[:place]
    #   when nil
    #     @product = Product.find(params[:product_id])
    #     @cart.add_item(@product)
    #     respond_to do |format|
    #       format.html{redirect_to products_path, notice: 'товарчик добавлена в корзину.'}
    #       format.js{}
    #     end
    #   when "cart"
    #     set_line_item
    #     @line_item.quantity+=1
    #     @line_item.save
    #     respond_to do |format|
    #       format.html{redirect_to @cart, notice: 'товареца добавлена в корзину.'}
    #       format.js{}
    #     end
    #   when "line_items"
    #     set_line_item
    #     @line_item.quantity+=1
    #     @line_item.save
    #     respond_to do |format|
    #       format.html{redirect_to line_items_path, notice: 'товара добавлена в корзину'}
    #       format.js{}
    #     end
    #   when "show"
    #     set_line_item
    #     @line_item.quantity+=1
    #     @line_item.save
    #     respond_to do |format|
    #       format.html{redirect_to product_path(@line_item.product), notice: 'Книга добавлена в корзину'}
    #       format.js{}
    #     end
    # end


    respond_to do |format|
      format.js do
        @product = Product.find(params['product_id'])
        @cart.add_item(@product)

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
  end

  def plus_minus
    # raise "ss"
    respond_to do |format|
      format.js do
        if params[:op] == 'plus'
          @line_item.update_attribute(:quantity, @line_item.quantity + 1)
          render('plus')
        elsif @line_item.quantity == 1
          @line_item.destroy
          render('destroy')
        else
          @line_item.update_attribute(:quantity, @line_item.quantity - 1)
          # render('minus')
          render('plus')
        end
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
    if @line_item.quantity == 1
      @line_item.destroy
    else
      @line_item.quantity -= 1
      @line_item.save
    end
    case params[:place]
      when "cart"
        redirect_to @cart, notice: 'Товар удалён.'
      when "show"
        redirect_to product_path(@line_item.product), notice: 'Товар удален'
      when "line_items"
        redirect_to line_items_path, notice: 'Товар удален'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:product_id, :price, :quantity)
    end

end
