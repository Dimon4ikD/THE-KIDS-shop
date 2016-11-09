class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :check_app_auth
  before_action :load_current_user
  # before_action :set_line_item_

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

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  private

  def record_not_found
    render plain:"404 Not Found", status: 404
  end

  def set_line_item_
    @line_item = LineItem.find(session[:line_item_id])
  rescue ActiveRecord::RecordNotFound
    @line_item = LineItem.create
    session[:line_item_id] = @line_item.id
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
