module AccountActivationsHelper
  def gravatar_url(user, options = {size: 60})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    "https://secure.gravatar.com/avatar/#{gravatar_id}?d=mp&&s=#{size}"
  end
end
