class Admin::BannersController < AdminController
  def index
    @banners = Banner.order(:id)
  end

  def new
    @banner = Banner.new
  end

  def create
    @banner = Banner.new banner_params

    if @banner.save
      redirect_to admin_banners_path
    else
      render :new
    end
  end

  def edit
    @banner = Banner.find params[:id]
  end

  def update
    @banner = Banner.find params[:id]

    if @banner.update_attributes banner_params
      redirect_to admin_banners_path
    else
      render :edit
    end
  end

  def destroy
    @banner = Banner.find params[:id]
    @banner.destroy
    redirect_to :back
  end

  private

  def banner_params
    params.require(:banner).permit!
  end
end