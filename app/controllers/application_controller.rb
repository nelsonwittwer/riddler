class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_filter do
    resource = controller_path.singularize.gsub('/', '_').to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "You are not authorized to access that resource."
    redirect_to root_path
  end

  def current_user
    @current_user = nil
    @current_user = User.find(session[:user_id]) if session[:user_id]
    return @current_user
  end  

private

  ## Devise - Store location upon login/logout
  def store_location
    session[:passthru] = params[:passthru] if params[:passthru]
  end

  def redirect_back_or_default(default)
    session[:passthru] || root_path
  end

  def after_sign_in_path_for(resource_or_scope)
    redirect_back_or_default(resource_or_scope)
  end 

  def after_sign_out_path_for(resource_or_scope)
    redirect_back_or_default(resource_or_scope)
  end 
end
