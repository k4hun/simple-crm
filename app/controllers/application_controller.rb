class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :authenticate_user
  before_action :get_activities
  
  helper_method :current_user
  helper_method :logged_in?
  
  def current_client
    @client = Client.find(params[:client_id])
  end
  
  def current_company
    @company = Company.find(params[:company_id])  
  end
  
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
  
  def current_account
    @account = Account.find(params[:id])
  end
  
  def require_admin
    redirect_to root_path, error: 'Dostępne tylko dla admina' if current_user.account.membership.role != 'admin'
  end
  
  def authenticate_user
    session[:return_to] = request.fullpath
    redirect_to login_path, alert: 'Nie jesteś zalogowany' unless session[:user_id].present?
  end

  def logged_in?
    session[:user_id].present?
  end
  
  def get_activities
    @activities = PublicActivity::Activity.order(created_at: :desc)
  end
  
end