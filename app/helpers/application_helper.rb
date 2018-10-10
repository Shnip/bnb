module ApplicationHelper
  def full_title(page_title = '')
    base_title = "BnB | Search and online booking of rooms, apartments and
                        private houses in different countries of the world"
    return base_title if page_title.empty?
    return page_title
  end

  def gravatar_url(user, options = {size: 60})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    "https://secure.gravatar.com/avatar/#{gravatar_id}?d=mp&&s=#{size}"
  end
end
