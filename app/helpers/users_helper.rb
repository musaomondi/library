module UsersHelper
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "profilepic.jpg#{gravatar_id}"
    link_to image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
