class StaticPagesController < ApplicationController
  def home
    @user = current_user
    @books =Book.all
  end

  def help
  end

  def about
  end

  def contact
    @user = current_user
  end
end
