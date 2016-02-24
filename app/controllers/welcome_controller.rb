class WelcomeController < ApplicationController
  before_action :loadAll

  def loadAll
    @messages = Message.all
    @images = Image.all
    @requests = Request.all
  end

end
