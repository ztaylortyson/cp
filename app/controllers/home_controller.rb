

class HomeController < ApplicationController
  before_action :authenticate_user!
  
  include Foo

  def index
    get_sbn
   
  end

 


  

end
