class Public::AddressesController < ApplicationController

  def index
    @addresses = current_customer.addresses.all
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to addresses_path
    end
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end

  # def address_display
  # '〒' + postal_code + ' ' + address + ' ' + name
  # end


  private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name, :customer_id)
  end

end
