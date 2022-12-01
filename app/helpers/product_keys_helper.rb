module ProductKeysHelper
  def self.working_days(key_obj)
    if key_obj.infinite_period
      -1
    else
      analiz_work_days(key_obj)
    end
  end

  def self.analiz_work_days(key_obj)
    delta_time = key_obj.created_at - Time.current
    if delta_time <= 0
      0
    else
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
