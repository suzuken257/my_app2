json.array!@comments do |comment|
  json.text  comment.text
  json.user_id  comment.user.id
  json.user_name  comment.user.nickname
  json.id comment.id
end
json.post_id  @post.id