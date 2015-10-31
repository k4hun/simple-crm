class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :authenticate_crm_user!
  
  def current_client
    @client = Client.find(params[:client_id])
  end
  
  def current_company
    @company = Company.find(params[:company_id])  
  end
  
end
