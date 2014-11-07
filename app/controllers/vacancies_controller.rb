class VacanciesController < ApplicationController
  def index
    @vacancies = Vacancy.order('id desc')
  end

  def show
    @vacancy = Vacancy.find params[:id]
  end

  def reply
  	@vacancy = Vacancy.find params[:id]

  	message = I18n.t(
  		'project.vacancy_reply_message',
  		name: params[:order][:name],
  		phone: params[:order][:phone],
  		locale: 'ru'
  	)

  	Pony.mail ({
        to: 'abardacha@gmail.com',
        subject: I18n.t('project.vacancy_reply_title', vacancy_name: @vacancy.name, locale: 'ru'),
        body: message,
        via: :smtp,
        via_options: {
            address: 'smtp.gmail.com',
            port: 587,
            enable_starttls_auto: true,
            user_name: 'abardacha@gmail.com',
            password: 'fiolent149',
            authentication: :plain
        }
    })
    
    render json: {status: :ok}
  end
end