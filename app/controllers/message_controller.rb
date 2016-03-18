class MessageController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    Request.create(body: params)
    if params[:From]
      message = Message.create(phone: params[:From], message: params[:Body], nummedia: params[:NumMedia], messagesid: params[:MessageSid])

      $i = 0
      $num = params[:NumMedia].to_i

      while $i < $num  do
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

  def sendsms
    account_sid = 'AC242d33bb6b3302ffc43775add3ce5720'
    auth_token = '76ff3c029b44629be2ca25c6bbc78107'

    #account_sid = 'AC45a8b9cd2b58370b180a149b15700301'
    #auth_token = 'a31cb48c7c1712a3d7d064d82df21e9b'
 
    # set up a client to talk to the Twilio REST API 
    @client = Twilio::REST::Client.new account_sid, auth_token 
 
    @client.account.messages.create({
      :from => params[:from],
      :to => params[:to],
      :body => params[:body],
      :media_url => params[:media_url] #'http://farm2.static.flickr.com/1075/1404618563_3ed9a44a3a.jpg', 
    })

    response = { :data => "ok" }
    render :json => response, :status => 200
  end

end
