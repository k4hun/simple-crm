class ClientInfosController < ApplicationController
  before_action :current_client, only: [:index, :create, :destroy]

  def index
    @infos = Info.where(client_id: params[:client_id])
    @info = Info.new
  end
  
  def create
    @info = current_client.infos.new(info_params)
    if @info.save
      redirect_to client_infos_path(current_client)
    else
      render 'index'
    end
  end
  
  def destroy
    Info.find(params[:id]).destroy
    redirect_to client_infos_path(current_client)
  end

  private

  def info_params
    params.require(:info).permit(:info_type, :value)
  end
end