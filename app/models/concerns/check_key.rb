# frozen_string_literal: true

# module for check_key
module CheckKey
  def self.analiz(keys)
    keys.each do |key|
      working_days(key)
    end
  end

  def self.working_days(key_obj)
    if key_obj.infinite_period
      -1
    else
      analiz_work_days(key_obj)
    end
  end

  def self.analiz_work_days(key_obj)
    if key_obj.duration * (60 * 60 * 24) <= Time.current - key_obj.created_at
      key_obj.status = false
      key_obj.save
      0
    else
      delta_time = key_obj.duration - (Time.current - key_obj.created_at)
      calcilation_work_days(delta_time)
    end
  end

  def self.calcilation_work_days(delta_time)
    delta_time = (delta_time / (60 * 60 * 24)).to_i  # 60*60*24 number sec in day
    if delta_time.zero?
      1
    else
      delta_time
    end
  end
end
