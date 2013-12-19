  # Google analytics ID
  GA.tracker = Configuration['google_analytics_id'] if Rails.env.production? && ActiveRecord::Base.connection.table_exists?('configurations') && Configuration['google_analytics_id'].present?

