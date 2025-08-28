json.extract! list, :id, :description, :completed, :created_at, :updated_at
json.days_ago ((Time.now - list.created_at) / 86400).round.to_s + " days ago"