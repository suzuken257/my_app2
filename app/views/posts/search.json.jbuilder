json.array! @posts do |post|
  json.id post.id
  json.title post.title
  json.video post.video
  json.text post.text
  json.user_id post.user_id
  json.user_name post.user.nickname
  json.user_sign_in current_user
end