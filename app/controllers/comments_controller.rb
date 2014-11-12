class CommentsController < ApplicationController
  def index
    @comments = Comment.where(moderated: true).order('id desc')
  end

  def create
    @comment = Comment.new comment_params

    if @comment.save


      message = I18n.t(
        'project.new_comment_message',
        url: @comment.get_url,
        locale: 'ru'
      )

      message += "\n"
      message += "http://tg.abardacha.ru/admin/comments"

      Pony.mail ({
          to: 'abardacha@gmail.com, peregubko.e@yandex.ru',
          subject: I18n.t('project.new_comment_title', locale: 'ru'),
          body: message.html_safe,
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
    else
      render json: {status: :error}
    end
  end

  private

  def comment_params
    params.require(:comment).permit!
  end

end