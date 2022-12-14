class ProductsController < ApplicationController
  before_action :authenticate_user!,except: [ :index, :show]
  before_action :set_product,only: [:edit, :show, :update, :destroy]
  before_action :set_item,only: [:edit, :destroy]
 

  def index
    @products = Product.all.order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
   
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    
  
  end
  
  def update
    
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end
  

  private
  def product_params
    params.require(:product).permit(:item_name, :explanation, :category_id,:situation_id, :delivery_id, :area_id, :shipment_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_product
   @product = Product.find(params[:id])
  end

  def set_item
    if @product.user != current_user || @product.order.present?
      redirect_to root_path
    end
  end

end
