class ClientsController < ApplicationController
  before_action :current_client, only: [:show, :edit, :note, :update, :destroy]

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

  def edit
  end

  def update
    if @client.update(client_params)
      redirect_to client_path(@client), notice: 'Dane zostały zmienione'
    else
      render 'edit'
    end
  end

  def destroy
    @client.destroy
    redirect_to clients_path, notice: 'Klient został usunięty'
  end

  def note
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
