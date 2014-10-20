class Admin::SettingsController < AdminController
  def edit
    @settings = Settings.first()
  end

  def update
    @settings = Settings.first
    @settings.update_attributes settings_params
    redirect_to edit_admin_setting_path
  end

  private

  def settings_params
    params.require(:settings).permit!
  end
end