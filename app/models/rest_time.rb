class RestTime < ApplicationRecord
  belongs_to :worktime

  validate :cannot_save_over_3times, on: :create

  private
  def cannot_save_over_3times
    if worktime.rest_times.count >= 3
      errors.add(:worktime_id, "は３回までしか休憩できません")
      throw :abort
    end
  end
end