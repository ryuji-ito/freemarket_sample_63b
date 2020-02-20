class Users::AddressController < ApplicationController
  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @address = Address.find(params[:id])
  end
  
  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  private
  def address_params
    params.require(:address).permit(:last_name_kanji, :first_name_kanji, :last_name_kana, :first_name_kana, :postal_code, :prefecture_id, :municipality, :house_number, :building_name, :tel).merge(user_id: current_user.id)
  end
end
