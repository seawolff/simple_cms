class DemoController < ApplicationController
  
  layout 'admin'
  
  def index
    #render the hello template
    #render('demo/hello')
    #redirect_to(:action => 'other_hello')
  end
  
  def hello
    #render(:text => 'HEllow Everyone!')
    #redirect_to("http://www.lynda.com")
    
    #@ specifies instance variables
    @array = [1,2,3,4,5]
    
    #.to_i creates integer from params (which are strings by default)
    @id = params[:id].to_i
    @page = params[:page].to_i
    
  end
  
  def other_hello
    render(:text => 'HEllow Everyone!')
  end
  
  def javascript
  end
  
  def text_helpers
  end
  
  def escape_output
  end
  
end
