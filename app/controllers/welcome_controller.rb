class WelcomeController < ApplicationController
  before_action :getMessages

  def getMessages
    @messages = Message.all
  end

end
