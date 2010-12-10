class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale
  before_filter :authenticate_user!

  def set_locale
    #@current_user=User.find(1)
    # if params[:locale] is nil then I18n.default_locale will be used
    
    if params[:locale]
      I18n.locale = params[:locale]
      session[:locale] = params[:locale]
    elsif current_user
      if current_user.language
        I18n.locale = current_user.language
      end
    elsif session[:locale]
      I18n.locale = session[:locale]
    end
      
  end

end
