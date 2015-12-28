class AdminMailer < ApplicationMailer

  default from: "torretravel2015@gmail.com"

  def torre_travel_destroyed(house)
    @torre_travel = house
    # attachments.inline['missing2.png'] = File.read('app/assets/images/small/missing2.png')
    attachments.inline['filename.jpg'] = {mime_type: 'application/x-gzip',
                                    content: @torre_travel.images.image_of_housing.url(:small)}
    mail to: 'torretravel2015@gmail.com',
         subject: "Жилье удалено"
    

  end

  def new_comment(comm)
    @comment = comm
    mail to: 'torretravel2015@gmail.com',
         subject: "Новый комментарий"
  end

end
