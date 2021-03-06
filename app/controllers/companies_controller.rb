class CompaniesController < ApplicationController
  before_action :current_company, only: [:show, :edit, :update, :destroy]
  before_action :current_client, only: [:show, :edit, :update, :destroy]
  
  def index
  	@companies = client.companies
  end

  def show
  end

  def new
  	@company = client.companies.new
  	@company.build_address
  end

  def create
  	@company = client.companies.new(company_params)
    if @company.save
      @company.create_activity key: "dodał firmę #{@company.name} dla klienta #{@company.client.name}", owner: current_user
      redirect_to client_path(client), notice: 'Firma został dodany'
    else
      render 'new'
    end
  end

  def edit
  end
  
  def update
    if @company.update(company_params)
      @company.create_activity key: "zaktualizował firmę #{@company.name} dla klienta #{@company.client.name}", owner: current_user
      redirect_to client_company_path(@client, @company), notice: 'Dane firmy zmienione'
    else
      render 'edit'
    end
  end
  
  def destroy
    @company.create_activity key: "usunął firmę #{@company.name} dla klienta #{@company.client.name}", owner: current_user
    @company.destroy
    redirect_to client_path(@client), notice: 'Klient został usunięty'
  end

  private 
  
  def current_company
    @company ||= Company.find(params[:id])
  end

  def client
  	@client ||= Client.find(params[:client_id])
  end

  def company_params
  	params.require(:company).permit(:name, :end_date, :description,
  									address_attributes: [:street, :zip_code, :city, :voivodeship])
  end
end
