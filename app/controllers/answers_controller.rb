class AnswersController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy]

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
       flash[:success] = 'Answer addded!'
       redirect_to root_url
     else
     render 'static_pages/home'
  end
end

  def destroy
    @answer.destroy
    flash[:success] = 'Answer deleted!'
    redirect_to request.referrer || root_url
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :micropost_id, :user_name, :user_email, :picture)
  end
end
