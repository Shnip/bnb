module ApplicationHelper
  def full_title(page_title = '')
    base_title = "BnB | Search and online booking of rooms, apartments and
                        private houses in different countries of the world"
    return base_title if page_title.empty?
    return page_title
  end

  def current_user?(user)
    user == current_user
  end
end
