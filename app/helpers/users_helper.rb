require 'digest'

module UsersHelper
  def avatar_for(user, size = 40, id = '')
    if user.avatar_url && user.avatar_url =~ (GOOGLE_AVATAR_STORAGE_REGEX)
      image_tag(google_avatar_url_for(user, size), alt: user.first_name,
                                                   class: 'avatar')
    else
      image_tag(user.picture.image.avatar.url, class: 'avatar',
                                        id: id,
                                        width: "#{size}px", height: "#{size}px")
    end
  end

  private

  GOOGLE_AVATAR_STORAGE_REGEX = %r{https://lh\d\.googleusercontent\.com.+}

  def google_avatar_url_for(user, size)
    url = user.avatar_url.split('=')[0] # crop off parameters
    "#{url}=s#{size}-c"
  end
end
