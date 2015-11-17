module ApplicationHelper
  def is_admin?
    if current_user.account.membership.role == 'admin'
      return true
    else 
      return false
    end
  end
  
  def activity(owner_id, key, parameters)
    return "#{User.find(owner_id).full_name} #{key}"
  end
end
