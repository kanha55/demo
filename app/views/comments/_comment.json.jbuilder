json.extract! comment, :id, :commenter, :comment, :post_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
