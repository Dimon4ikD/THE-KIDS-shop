class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  skip_before_action :check_app_auth, only: [:show, :index, :search]
  # skip_before_filter :require_login, :only => [:index, :new, :create, :activate]

  # GET /products
  # GET /products.json
  def index
    @products = Product.page(params[:page])

    @type=params[:typee].to_i
    if @type.blank?
      @type=3
    end
    # raise @type.to_s
  end

  def search
    hsh = Hash.new{ |h, k| h[k] = [] }
    PgSearch.multisearch(params[:search]).each do |sr|
      hsh[eval(sr.searchable_type)] << sr.searchable_id
    end
    @products = Product.includes(:catalog).find(hsh[Product])
    @catalogs = Catalog.find(hsh[Catalog])
    # @results = hsh.keys.map{ |k| k.find(hsh[k]) }.flatten
    # raise @results.inspect
  end


  def save
    if !@current_user.try(:is_admin?)
      @products = Product.includes(:catalog).all

      respond_to do |format|
        format.xlsx do
          response.headers['Content-Disposition'] = 'attachment; filename="база_данных_продукты.xlsx"'
        end
      end
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    if !@current_user.try(:is_admin?)
      redirect_to new_user_path, notice:"Вы не админинстратор"
    else
      @product = Product.new
    end
  end

  # GET /products/1/edit
  def edit
    if !@current_user.try(:is_admin?)
      redirect_to new_user_path, notice:"Вы не админинстратор"
    end
  end

  # POST /products
  # POST /products.json
  # def create
  #   @product = Product.new(product_params)
  #
  #   respond_to do |format|
  #     if @product.save
  #       format.html { redirect_to @product, notice: 'Product was successfully created.' }
  #       format.json { render :show, status: :created, location: @product }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @product.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def create
    @product = Product.new(product_params)
    # @book.document = params[:book][:document]
    if @product.save
      redirect_to @product
    else
      render :new
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Товар успешно изменен.'
    else
      render :edit
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Товар успешно удален.'
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end
    def manager_permission
      render_error unless Product.manage?(@current_user)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :amount, :cover_id, :price, :catalog_id, :description)
    end
end
