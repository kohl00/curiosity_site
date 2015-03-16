module ApplicationHelper

  def current_user?
    current_user == @recipe.user
  end

  def signed_in?
  	!current_user.nil?
  end

end
