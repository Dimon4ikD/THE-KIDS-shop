class CatalogsController < ApplicationController
  before_action :set_catalog, only: [:show, :edit, :update, :destroy]
  skip_before_action :check_app_auth, only: [:show, :index]

  # GET /catalogs
  # GET /catalogs.json
  def index
    # @catalogs = Catalog.all
    @catalogs = Catalog.ordering.page(params[:page])
  end

  # GET /catalogs/1
  # GET /catalogs/1.json
  def show
    @products=@catalog.products.page(params[:page])
  end

  # GET /catalogs/new
  def new
    @catalog = Catalog.new
  end

  # GET /catalogs/1/edit
  def edit
  end

  # POST /catalogs
  # POST /catalogs.json
  def create
    @catalog = Catalog.new(catalog_params)
    @catalog.HyTML = params['content']

    respond_to do |format|
      if @catalog.save
        format.html { redirect_to @catalog, notice: 'Каталог был успешно создан.' }
        format.json { render :show, status: :created, location: @catalog }
      else
        format.html { render :new }
        format.json { render json: @catalog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /catalogs/1
  # PATCH/PUT /catalogs/1.json
  def update
    # raise params.inspect
    @catalog.HyTML = params['content']
    respond_to do |format|
      if @catalog.update(catalog_params)
        format.html { redirect_to @catalog, notice: 'Каталог был успешно изменен.' }
        format.json { render :show, status: :ok, location: @catalog }
      else
        format.html { render :edit }
        format.json { render json: @catalog.errors, status: :unprocessable_entity }
      end

    end
  end

  # DELETE /catalogs/1
  # DELETE /catalogs/1.json
  def destroy
    @catalog.destroy
    respond_to do |format|
      format.html { redirect_to catalogs_url, notice: 'Каталог был успешно удален.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catalog
      @catalog = Catalog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def catalog_params
      params.require(:catalog).permit(:name, :HyTML, :description, :sections)
    end
end
