require 'digest'

module UsersHelper
  def gravatar_for(user, size: 40)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.first_name, class: 'gravatar')
  end

  def avatar_for(user, size: 40)
    if user.avatar_url && user.avatar_url =~ (GOOGLE_AVATAR_STORAGE_REGEX)
      image_tag(google_avatar_url_for(user, size), alt: user.first_name, class: 'gravatar')
    else
      gravatar_for(user, size: size)
    end
  end

  private

  GOOGLE_AVATAR_STORAGE_REGEX = %r{https://lh\d\.googleusercontent\.com.+}

  def google_avatar_url_for(user, size)
    url = user.avatar_url.split('=')[0] # crop off parameters
    "#{url}=s#{size}-c"
  end
end
