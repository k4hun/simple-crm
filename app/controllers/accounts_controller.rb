class AccountsController < ApplicationController
  skip_before_filter :authenticate_user
  before_action :require_admin, only: [:new, :edit, :update, :create, :make_admin]
  before_action :current_account, only: [:show, :edit, :make_admin]
  
  def index
    @accounts = Account.all  
  end
  
  def show
  end
  
  def new
    @account = Account.new
    @account.build_user
    @account.build_membership
  end

  def create
    @account = Account.new(register_params)
    if @account.save
      redirect_to accounts_path, notice: 'Użytkownik utworzony!'
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @account.update(register_params)
      redirect_to account_path(@account), notice: 'Dane zmienione'
    else
      render 'edit'
    end
  end
  
  def make_admin
    @account.membership.make_admin
    redirect_to accounts_path
  end
  
  private
  
  def register_params
    params.require(:account).permit(:email, :password, :password_confirmation, user_attributes: [:first_name, :last_name])
  end
end
