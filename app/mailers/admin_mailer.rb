class AdminMailer < ApplicationMailer

  default from: "torretravel2015@gmail.com"

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

end
