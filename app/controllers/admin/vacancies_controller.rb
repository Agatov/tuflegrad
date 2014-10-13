class Admin::VacanciesController < AdminController
  def index
    @vacancies = Vacancy.order(:id)
  end

  def new
    @vacancy = Vacancy.new
  end

  def create
    @vacancy = Vacancy.new vacancy_params

    if @vacancy.save
      redirect_to admin_vacancies_path
    else
      render :new
    end
  end

  def edit
    @vacancy = Vacancy.find params[:id]
  end

  def update
    @vacancy = Vacancy.find params[:id]

    if @vacancy.update_attributes vacancy_params
      redirect_to admin_vacancies_path
    else
      render :edit
    end
  end

  def destroy
    @vacancy = Vacancy.find params[:id]
    @vacancy.destroy
    redirect_to :back
  end

  private

  def vacancy_params
    params.require(:vacancy).permit!
  end
end