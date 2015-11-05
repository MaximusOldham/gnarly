class WelcomeController < ApplicationController
  def index
    @gnarlies = Gnarlie.all
  end
end
