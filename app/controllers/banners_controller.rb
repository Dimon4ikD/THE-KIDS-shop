class BannersController < ApplicationController
  before_action :set_banner, only: [:show, :edit, :update, :destroy]
  # before_action :manager_permission #, except: [:index, :show]
  skip_before_action :check_app_auth, only: [:show, :index, :new, :create]
  # before_action :click
  # GET /banners
  # GET /banners.json
  def index
    @banners = Banner.all
  end

  # GET /banners/1
  # GET /banners/1.json
  def show

  end


  # def click
  #   @banner = Banner.find(params[:id])
  #   @banner.increment!(:clicks) #-> saves the record
  #   redirect_to @banner.film
  # end





  # GET /banners/new
  def new
    @banner = Banner.new
    # @banner.click=0
  end

  # GET /banners/1/edit
  def edit

  end

  # POST /banners
  # POST /banners.json


  def create
    @banner = Banner.new(banner_params)
    # @banner.click=0
    if @banner.save
      redirect_to @banner, notice: 'Баннер создан'
    else
      render :new
    end

  end

  # PATCH/PUT /banners/1
  # PATCH/PUT /banners/1.json
  def update
    respond_to do |format|
      if @banner.update(banner_params)
        format.html { redirect_to @banner, notice: 'Banner was successfully updated.' }
        format.json { render :show, status: :ok, location: @banner }
      else
        format.html { render :edit }
        format.json { render json: @banner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /banners/1
  # DELETE /banners/1.json
  def destroy
    @banner.destroy
    respond_to do |format|
      format.html { redirect_to banners_url, notice: 'Banner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_banner
      @banner = Banner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def banner_params
      params.require(:banner).permit(:catalog_id, :image, :frequency, :start_date, :end_date, :click)
    end


end
