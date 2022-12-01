class FindClientsController < ApplicationController
  def find_client; end

  def result_client

    params.each do |x, y|
        if x != 'lang'
           if x == 'data_begin' || x == 'data_end'
           else
           end
        end    
    end    
    
    # if !params[:name].empty?
    #     s = "WHERE name LIKE '" + '%' + params[:name]+ '%'
    # end
    
    # if s

    

  end
end
