class CompaniesController < ApplicationController
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
    if @client.save
      redirect_to client_path(client), notice: 'Firma został dodany'
    else
      render 'new'
    end
  end

  def edit
  end

  private 

  def client
  	@client ||= Client.find(params[:client_id])
  end

  def company_params
  	params.require(:company).permit(:name, :end_date, 
  									address_attributes: [:street, :zip_code, :city, :voivodeship])
  end
end
