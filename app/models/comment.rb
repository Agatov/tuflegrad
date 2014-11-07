class Comment < ActiveRecord::Base
  def get_url
  	"http://tg.abardacha.ru/admin/comments/#{id}"
  end
end
