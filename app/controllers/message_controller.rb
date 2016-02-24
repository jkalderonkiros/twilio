class MessageController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    Request.create(body: params)
    if params[:From]
      message = Message.create(phone: params[:From], message: params[:Body], nummedia: params[:NumMedia], messagesid: params[:MessageSid])

      $i = 0
      $num = params[:NumMedia].to_i

      while $i <= $num  do
        $contentkey = "MediaContentType#{$i}"
        $mediaurl = "MediaUrl#{$i}"

        Image.create(contenttype: params[$contentkey], url: params[$mediaurl], message: message)
        $i +=1
      end

      render :json => message, :status => 201
    else
      render :json => response, :status => 500
    end
  end

  def get
    response = { :errors => "hello" }
    render :json => response, :status => 200
  end

end
