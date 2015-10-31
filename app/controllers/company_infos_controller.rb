class CompanyInfosController < ApplicationController
  before_action :current_client, only: [:index, :create, :destroy]
  before_action :current_company, only: [:index, :create, :destroy]
  
  def index
    @infos = Info.where(company_id: params[:company_id])
    @info = Info.new
  end
  
  def create
    @info = current_company.infos.new(info_params)
    if @info.save
      redirect_to client_company_infos_path(current_client, current_company)
    else
      render 'index'
    end
  end
  
  def destroy
    Info.find(params[:id]).destroy
    redirect_to client_company_infos_path(current_client, current_company)
  end

  private

  def info_params
    params.require(:info).permit(:info_type, :value)
  end
end
