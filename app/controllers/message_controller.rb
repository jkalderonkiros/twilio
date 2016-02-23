class MessageController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    response = { :errors => "helloooo" }
    if params[:phone_number]
      message = Message.create(phone: params[:phone_number], message: params[:message])
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
