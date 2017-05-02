module ApplicationHelper
  #remove empty helpers
protected
  def full_name user
    user.first_name + " " + user.last_name
  end
end
