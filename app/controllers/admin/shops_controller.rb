class Admin::ShopsController < AdminController
  def index
    @shops = Shop.order(:id)
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new shop_params

    if @shop.save
      redirect_to admin_shops_path
    else
      render :new
    end
  end

  def edit
    @shop = Shop.find params[:id]
  end

  def update
    @shop = Shop.find params[:id]

    if @shop.update_attributes shop_params
      redirect_to admin_shops_path
    else
      render :edit
    end
  end

  def destroy
    @shop = Shop.find params[:id]
    @shop.destroy
    redirect_to :back
  end

  private

  def shop_params
    params.require(:shop).permit!
  end
end