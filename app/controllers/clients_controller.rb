class ClientsController < ApplicationController
  before_action :current_client, only: [:show, :destroy]

  def index
    @clients = Client.all
  end

  def show
  end

  def new
    @client = Client.new
    @client.build_address
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to clients_path, notice: 'Klient został dodany'
    else
      render 'new'
    end
  end

  def destroy
    @client.destroy
    redirect_to clients_path, notice: 'Klient został usunięty'
  end

  private

  def client_params
    params.require(:client).permit(:firstname, :lastname, :nip, :comment,
                                    address_attributes: [:street, :zip_code, :city, :voivodeship])
  end

  def current_client
    @client = Client.find(params[:id])
  end
end
