class Public::AddressesController < ApplicationController

  def index
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
  
  def address_display
  '〒' + postal_code + ' ' + address + ' ' + name
  end

end
