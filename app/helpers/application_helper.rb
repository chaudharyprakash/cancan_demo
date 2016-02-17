module ApplicationHelper

def voter_names(picture)
  user_ids = picture.get_likes.pluck(:voter_id)
  emails = User.where(id: user_ids).pluck(:email)
  return emails.join('&#10;').html_safe
end


end
