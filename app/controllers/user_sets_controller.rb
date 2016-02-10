class UserSetsController < ApplicationController

  def create
    @user_set = UserSet.new user_set_params
    if @user_set.save
      redirect_to current_user
    else
    end

  end

  private
  def user_set_params
    params.require(:user_set).permit :title, :description, :set_type,
      :user_id, :category_id, words_attributes: [:id, :category_id, :content, :_destroy,
      answers_attributes: [:id, :word_id, :content]]
  end
end