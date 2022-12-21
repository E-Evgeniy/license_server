# frozen_string_literal: true

# module for forming find string request
module StringRequest

  def self.forming_query_string(params, obj)
    puts('ssssssssssLL',@exceptions)
    s_date = find_begin_end(params[:data_begin], params[:data_end], obj, 'created_at')

    return if s_date.nil?
    s_duration = ''
    if obj == 'Productkey'
      s_duration = " AND #{find_begin_end(params[:duration_begin],
                   params[:duration_end], obj, 'duration')}"
    end

    s_parametrs = find_parametrs(params)
    puts('LLLLLLLLLLLLLL',"#{s_date} #{s_parametrs} #{s_duration}")
    "#{s_date} #{s_parametrs} #{s_duration}"
  end

  def self.find_parametrs(params)
    query_str = ''
    query_str_boolean = ''
    params.each do |key, value|
      query_str = check_params(key, value, query_str)
      query_str_boolean = check_boolean_params(key, value, query_str_boolean)
    end

    "#{query_str} #{query_str_boolean}"
  end

  def self.check_boolean_params(key, value, result)
    values = %w[infinite_period status key_type]

    if values.include? key
      "#{result} AND #{key} = #{value}"
    else
      result
    end
  end

  def self.check_params(key, value, result)
    exceptions = %w[lang data_begin data_end controller action
                    duration_begin duration_end infinite_period
                    status key_type]

    if exceptions.include?(key) || value.empty?
      result
    else
      "#{result} AND #{key} LIKE '%#{value}%'"
    end
  end

  def self.find_begin_end(period_begin, period_end, obj, field)
    return if eval("#{obj}.all.empty?")

    "#{field} between '#{find_date(period_begin, obj, 'asc', 0, field)}' and '#{find_date(period_end, obj, 'desc', 10, field)}'"
  end

  def self.find_date(data_perid, obj, sort, delta, field)
    if data_perid.empty?
      eval("#{obj}.order(#{field}: :#{sort}).first.#{field} + #{delta}").to_s
    else
      data_perid
    end
  end
end
