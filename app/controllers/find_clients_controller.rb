class FindClientsController < ApplicationController
  def find_client; end

  def result_client

    params.each do |x, y|
        puts('x',x)
        puts('y',y)
    end    
    
    # if !params[:name].empty?
    #     s = "WHERE name LIKE '" + '%' + params[:name]+ '%'
    # end
    
    # if s

    

  end
end
