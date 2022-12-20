# frozen_string_literal: true

# module for forming find string request
module StringRequest
  def self.forming_query_string(params, obj)
    s_date = find_begin_end(params[:data_begin], params[:data_end], obj, 'created_at')

    return if s_date.nil?

    if obj == 'Productkey'
      s_duration = find_begin_end(params[:duration_begin],
                   params[:duration_end], obj, 'duration')
      s_parametrs_boolean =              
    end

    s_parametrs = find_parametrs(params)
    puts('LLLLLLLLLLLLLL',"#{s_date} #{s_parametrs}")
    "#{s_date} #{s_parametrs}"
  end

  def self.find_parametrs(params)
    result = ''
    params.each do |key, value|
      result = "#{result} AND #{key} LIKE '%#{value}%'" unless check_params(key, value)
    end
    
    result
  end

  def self.check_params(key, value)
    key == 'lang' || value.empty? || key == 'data_begin' ||
      key == 'data_end' || key == 'controller' || key == 'action'
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
