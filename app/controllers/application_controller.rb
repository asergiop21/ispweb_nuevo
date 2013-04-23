class ApplicationController < ActionController::Base
  protect_from_forgery
  
#    rescue_from CanCan::AccessDenied do |exception|
 #   flash[:error] = "Access Denied!"
  #   redirect_to :back 
  #  end
  
  protected
   # before_filter :set_i18n_locale_from_params
    before_filter :set_locale
private
  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?

       # if params[:locale]
       #   if I18n.available_locales.include?(params[:locale].to_sym)
       #   else
       #     flash.now[:notice] = 
       #       "#{params[:locale]} translation not available"
       #       logger.error flash.now[:notice]
       #   end
        #end
    end
    
    def default_url_options(options = {})
      {locale: I18n.locale}
    end
    
    
    
    
    #before_filter :set_user_language
#    private

 #   def set_user_language
  #    I18n.locale = 'en'
   # end

end
