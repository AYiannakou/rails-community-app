class StaticPagesController < ApplicationController
  def home
    @microposts = Micropost.all
    @user = User.new
  end

  def help
  end
  
  def about
  end
end
