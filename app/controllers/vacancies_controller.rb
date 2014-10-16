class VacanciesController < ApplicationController
  def index
    @vacancies = Vacancy.order('id desc')
  end

  def show
    @vacancy = Vacancy.find params[:id]
  end

  def reply
  end
end