class TelephoneNumbersController < ApplicationController
  
  before_filter :login_required

  # GET /telephone_numbers
  # GET /telephone_numbers.xml
  def index
#    @contacts = Contact.find(:all)
    @contacts = session[:user].contacts
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contacts }
    end
  end

end
