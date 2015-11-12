class AccountsController < ApplicationController
  skip_before_filter :authenticate_user
  
  def new
    @account = Account.new
    @account.build_user
  end

  def create
    @account = Account.new(register_params)
    if @account.save
      redirect_to root_path, notice: 'Użytkownik utworzony!'
    else
      render 'new'
    end
  end

  def register_params
    params.require(:account).permit(:email, :password, user_attributes: [:first_name, :last_name])
  end
end
