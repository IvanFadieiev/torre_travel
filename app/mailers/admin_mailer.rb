# class Admin Mailer
class AdminMailer < ApplicationMailer
  default from: 'torretravel2015@gmail.com'

  def torre_travel_destroyed(house)
    @torre_travel = house
    mail to: 'torretravel2015@gmail.com',
         subject: "Жилье удалено"
  end

  def new_comment(comm)
    @comment = comm
    mail to: 'torretravel2015@gmail.com',
         subject: "Новый комментарий"
  end

  def new_housing(torre_travel)
    @torre_travel = torre_travel
    mail to: Comment.pluck(:email).uniq ,
         subject: "Новое жилье"
  end

  def edit_housing(torre_travel)
    @torre_travel = torre_travel
    mail to: Comment.pluck(:email).uniq ,
         subject: "Жилье обновлено"
  end
end
