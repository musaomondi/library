module LeasesHelper
  def remaining_days(lease)
    # distance_of_time_in_words(lease.accept.created_at + 14.days, lease.accept.created_at)
    # (lease.created_at + 14.days).to_date
  end
end
