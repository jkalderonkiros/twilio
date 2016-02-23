class MessageController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    if params[:phone_number]
      message = Message.create(phone: params[:From], message: params[:Body])
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
