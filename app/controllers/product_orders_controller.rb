class ProductOrdersController < ApplicationController
  before_action :set_product_order, only: [:show, :edit, :update, :destroy]
  skip_before_action :check_app_auth, only: [:show, :index, :new]

  # GET /product_orders
  # GET /product_orders.json

  def index
    if !@current_user.blank?
      if @current_user.role == 0
        @product_orders = ProductOrder.where(user_id: @current_user.id).ordering.page(params[:page])
      else
        @product_orders = ProductOrder.ordering.page(params[:page])
      end
    end
  end

  # GET /product_orders/1
  # GET /product_orders/1.json
  def show
  end

  # GET /product_orders/new
  def new
    @product_order = ProductOrder.new
  end

  # GET /product_orders/1/edit
  def edit
  end

  # POST /product_orders
  # POST /product_orders.json
  # def create
  #   @product_order = ProductOrder.new(product_order_params)
  #
  #   respond_to do |format|
  #     if @product_order.save
  #       format.html { redirect_to @product_order, notice: 'Product order was successfully created.' }
  #       format.json { render :show, status: :created, location: @product_order }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @product_order.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def create
    @product_order = ProductOrder.new(new_product_order_params)
    @product_order.cart = @cart
    @product_order.user = @current_user
    # @book_order.decrease_q
    @product_order.add_lineitems(@cart)
    if @product_order.save
      session.delete(:cart_id)
      redirect_to root_path, notice: 'Заказ оформлен.'
    else
      render :new
    end
  end


  # PATCH/PUT /product_orders/1
  # PATCH/PUT /product_orders/1.json
  def update
    respond_to do |format|
      if @product_order.update(product_order_params)
        format.html { redirect_to @product_order, notice: 'Заказ изменен.' }
        format.json { render :show, status: :ok, location: @product_order }
      else
        format.html { render :edit }
        format.json { render json: @product_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_orders/1
  # DELETE /product_orders/1.json
  def destroy
    @product_order.destroy
    respond_to do |format|
      format.html { redirect_to product_orders_url, notice: 'Заказ удален.' }
      format.json { head :no_content }
    end
  end

  private


  # Use callbacks to share common setup or constraints between actions.
    def set_product_order
      @product_order = ProductOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_order_params
      params.require(:product_order).permit(:user_id, :product_id, :lineitem_id)
    end

    def new_product_order_params
      params.require(:product_order).permit(:address, :comment)
    end


    #
    #
    #
    # # Use callbacks to share common setup or constraints between actions.
    # def set_product_order
    #   @product_order = ProductOrder.find(params[:id])
    # end
    #
    # # Never trust parameters from the scary internet, only allow the white list through.
    # def product_order_params
    #   params.require(:product_order).permit(:User_id, :Product_id, :LineItem_id)
    # end
end
