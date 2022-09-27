class ProductsController < ApplicationController
  before_action :authenticate_user!,except: [ :index, :show]
 

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
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end
  

  private
  def product_params
    params.require(:product).permit(:item_name, :explanation, :category_id,:situation_id, :delivery_id, :area_id, :shipment_id, :price, :image).merge(user_id: current_user.id)
  end

  #def set_product
   # @product = Product.find(params[:id])
  #end

end
