class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :check_app_auth
  before_action :load_current_user
  before_action :set_cart_
  before_action :load_banners
  # before_action :set_line_item_


  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def give_time
    @time = Time.now.utc.to_s.split(" ").second
    render :partial => 'shared/time_portion'
  end

  def give_time_2

    @time = Time.now.strftime("%H:%M:%S ")

    render :partial => 'shared/time_portion'

  end
  def load_banners
    @banners=Banner.all
  end

  private
  def not_authenticated
    redirect_to login_path, alert: "Сначала войдите в систему!"
  end

  def load_current_user
    @current_user = current_user
  end

  def check_app_auth
    render 'access_denied' unless @current_user.try(:is_admin?)
  end


  def record_not_found
    render plain:"404 Not Found", status: 404
  end

  def set_cart_
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end

  def set_current_user
    if session[:user_id].present?
      @current_user=User.find(session[:user_id])
    end
  end

  def require_login
    if !@current_user
      flash[:danger]="Требуется авторизация"
      redirect_to login_path
    end
  end

  def manager_permission
    unless @current_user.try(:is_moderator?)
      flash[:danger]="Недостаточно прав"
      redirect_to login_path
    end
  end

  def admin_permission
    unless @current_user.try(:is_admin?)
      flash[:danger]="Недостаточно прав"
      redirect_to login_path
    end
  end



end
