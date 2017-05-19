class HomeController < ApplicationController
  before_filter :autheniticate_user!

def index
  @user = current_user
end
end
