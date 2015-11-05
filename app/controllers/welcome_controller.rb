class WelcomeController < ApplicationController
  def index
    @gnarlies = Gnarly.all
  end
end
