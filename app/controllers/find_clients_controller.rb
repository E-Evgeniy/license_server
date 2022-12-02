class FindClientsController < ApplicationController
  def find_client; end

  def result_client
    sql_request_str = find_request(params)

    params.each do |key, value|
      
      s_parametrs = find_parametrs()

        if x != 'lang' && value.empty?
           if key == 'data_begin' || key == 'data_end'
            s_data = find_begin_end(params[:data_begin], params[:data_end])
           else

           end
        end    
    end    
    
    # if !params[:name].empty?
    #     s = "WHERE name LIKE '" + '%' + params[:name]+ '%'
    # end
    
    # if s


    private

    def find_request(params)
      s_date = find_begin_end(params[:data_begin], params[:data_end])
      s_parametrs = find_parametrs(params)
    end

    def find_begin_end(data_begin, data_end, obj)
      return if eval(obj + '.all.empty?')

        hash_data = {}
        if data_begin.empty?
          hash_data['data_begin'] = eval(obj + '.order(:created_at).first.created_at')
        else
          hash_data['data_begin'] = data_begin.to_date
        end
    
        if data_end.empty?
          hash_data['data_end'] = eval(obj + '.order(reated_at: :desc).first.created_at')
        else
          hash_data['data_end'] = data_end.to_date
        end

        'created_at between ' + hash_data['data_begin'].to_s + ' and ' + hash_data['data_end'].to_s
    end 

    

  end
end
