json.array!@comments do |comment|
  json.text  comment.text
  json.user_id  comment.user.id
  json.user_name  comment.user.nickname
  json.id comment.id
  # json.post_id  comment.post.id
end
