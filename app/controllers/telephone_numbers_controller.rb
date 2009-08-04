class TelephoneNumbersController < ApplicationController
  
  before_filter :login_required

  # GET /contacts/1/telephone_numbers/1/edit
  def edit
    @contact = Contact.find_by_id_and_user_id(params[:contact_id], session[:user].id)
    @telno = TelephoneNumber.find_by_id_and_contact_id(params[:id], params[:contact_id])
  end

  # PUT /contacts/1
  # PUT /contacts/1.xml
  def update
    @contact = Contact.find_by_id_and_user_id(params[:contact_id], session[:user].id)
    @telno = TelephoneNumber.find_by_id_and_contact_id(params[:id], params[:contact_id])

    respond_to do |format|
      if @telno.update_attributes(params[:telephone_number])
        flash[:notice] = 'Telephone Number was successfully updated.'
        format.html { redirect_to(@contact, :action=>:edit) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contact.errors, :status => :unprocessable_entity }
      end
    end
  end

  # GET /contacts/1/telephone_numbers/new
  # GET /contacts/1/telephone_numbers/new.xml
  def new
    @contact = Contact.find_by_id_and_user_id(params[:contact_id], session[:user].id)
    @telno = TelephoneNumber.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @telno }
    end
  end

  # POST /contacts/1/telephone_numbers
  # POST /contacts/1/telephone_numbers.xml
  def create
    @contact = Contact.find_by_id_and_user_id(params[:contact_id], session[:user].id)
    @telno = TelephoneNumber.new(params[:telephone_number])
    @telno.contact_id = params[:contact_id]

    respond_to do |format|
      if @telno.save
        flash[:notice] = 'Telephone Number was successfully created.'
        format.html { redirect_to(@contact, :action=>:edit) }
        format.xml  { render :xml => @contact, :status => :created, :location => @contact }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contact.errors, :status => :unprocessable_entity }
      end
    end
  end


end
