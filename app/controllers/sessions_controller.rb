class SessionsController < ApplicationController
  skip_before_filter :authenticate_user
  
  def new
  end

  def create
    auth = Account.authenticate(params[:sessions][:email], params[:sessions][:password])
    if auth
      session[:user_id] = auth.user_id
      flash[:notice] = 'Zalogowano pomyślnie'
      current_user.account.touch
      redirect_to root_path
    else
      redirect_to login_path, alert: 'Zły login lub hasło'
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'Wylogowano'
  end
end
