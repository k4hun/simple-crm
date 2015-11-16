module ApplicationHelper
  def is_admin?
    if current_user.account.membership.role == 'admin'
      return true
    else 
      return false
    end
  end
end
