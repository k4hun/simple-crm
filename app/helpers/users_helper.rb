module UsersHelper
  def is_admin?
    if current_user.membership.role == 'admin'
      return true
    else 
      return false
    end
  end
end
