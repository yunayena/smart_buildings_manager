class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_filter :set_persist_locale

  def set_locale
    I18n.locale = params[:locale].to_sym || I18n.default_locale

    redirect_to root_path
  end

  def index
    if current_user
      @building_count = current_user.buildings.count
      @location_count = current_user.locations.count
      @board_count = current_user.boards.count
      @sensor_count = current_user.sensors.count
    end
  end

  # Ensure locale persists
  def default_url_options(options = {})
    { :locale => I18n.locale }
  end

  protected def set_persist_locale
    I18n.locale = params[:locale].to_sym || I18n.locale
  end
end
