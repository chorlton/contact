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
end
