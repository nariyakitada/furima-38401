class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product
  before_action :set_record

  def index
    @record_address = RecordAddress.new
  end

  def new
    @record_address = RecordAddress.new
  end


  def create
    
    @record_address = RecordAddress.new(record_params)
    
    if @record_address.valid?
      pay_item
    
      @record_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end


  private

  def record_params
    params.require(:record_address).permit(:post_code, :area_id, :municipalities, :adress, :building_name, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id],token: params[:token])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

   def pay_item
    
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    
      Payjp::Charge.create(
        amount: @product.price,
        card: record_params[:token],
        currency: 'jpy' 
      )
   end

   def set_record
    if @product.order.present? || @product.user_id == current_user.id
      redirect_to root_path
    end
  end
end

