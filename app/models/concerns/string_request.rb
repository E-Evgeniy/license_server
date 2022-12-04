# frozen_string_literal: true

# module for forming find string request
module StringRequest
  def self.forming_query_string(params, obj)
    s_date = find_begin_end(params[:data_begin], params[:data_end], obj)

    return if s_date.nil?

     s_parametrs = find_parametrs(params)
    "SELECT * FROM #{obj.downcase}s WHERE #{s_date} #{s_parametrs}"
  end

  def self.find_parametrs(params)
    result = {}
    params.each do |key, value|
      result = "#{result} AND #{key} LIKE '%#{value}%'" unless check_params(key, value)
    end
    result
  end

  def self.check_params(key, value)
    key == 'lang' || value.empty? || key == 'data_begin' ||
      key == 'data_end' || key == 'controller' || key == 'action'
  end

  def self.find_begin_end(data_begin, data_end, obj)
    return if eval("#{obj}.all.empty?")

    "created_at between '#{find_date(data_begin, obj, 'asc')}' and '#{find_date(data_end, obj, 'desc')}'"
  end

  def self.find_date(data_time, obj, sort)
    if data_time.empty?
      eval("#{obj}.order(created_at: :#{sort}).first.created_at").to_s
    else
      data_time
    end
  end
end