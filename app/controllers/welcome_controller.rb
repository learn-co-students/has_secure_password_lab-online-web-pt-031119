class WelcomeController < ApplicationController
  def home
    render 'sessions/new' unless logged_in?
  end
end
