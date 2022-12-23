# frozen_string_literal: true

# module for forming find string request
module StringRequest

  def self.forming_query_string(params, obj)
    s_date = find_begin_end(params[:data_begin], params[:data_end], obj, 'created_at', 0, 10)

    return if s_date.nil?

    s_duration = ''
    if obj == 'Productkey'
      s_duration = " AND #{find_begin_end(params[:duration_begin],
                   params[:duration_end], obj, 'duration', 0, 0)}"
    end

    s_parametrs = find_parametrs(params)
    "#{s_date} #{s_parametrs} #{s_duration}"
  end

  def self.find_parametrs(params)
    query_str = ''
    query_str_strong = ''
    params.each do |key, value|
      query_str = check_params(key, value, query_str)
      query_str_strong = check_strong_params(key, value, query_str_strong, params)
    end

    "#{query_str} #{query_str_strong}"    
  end

  def self.check_strong_params(key, value, result,params)
    values = %w[infinite_period status key_type]

    if values.include? key
      forming_strong_str(key, value, result, params)
    else
      result
    end
  end

  def self.forming_strong_str(key, value, result, params)
    if key == 'key_type'
      "#{result} AND key_type_id = #{value['key_type_id']}" if need_key_type(params)
    else
      "#{result} AND #{key} = #{value}" unless value == 'all'
    end    
  end

  def self.need_key_type(params)
    params['consider_the_key_type']['accepted'] == 'yes'
  end
    

  def self.check_params(key, value, result)
    exceptions = %w[lang data_begin data_end controller action
                    duration_begin duration_end infinite_period
                    status key_type consider_the_key_type]

    if exceptions.include?(key) || value.empty?
      result
    else
      "#{result} AND #{key} LIKE '%#{value}%'"
    end
  end

  def self.find_begin_end(period_begin, period_end, obj, field, delta_begin, delta_end)
    return if eval("#{obj}.all.empty?")
    initial_value = find_date(period_begin, obj, 'asc', delta_begin, field)
    final_value = find_date(period_end, obj, 'desc', delta_end, field)

    "#{field} between '#{initial_value}' and '#{final_value}'"
  end

  def self.find_date(data_perid, obj, sort, delta, field)
    if data_perid.empty?
      eval("#{obj}.order(#{field}: :#{sort}).first.#{field} + #{delta}").to_s
    else
      data_perid
    end
  end
end
