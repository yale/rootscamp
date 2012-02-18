class PrivateContactsController < ApplicationController
  respond_to :json

  # GET /users/:id/private_contacts.json
  def index
    @private_contacts = User.find(params[:user_id]).private_contacts
  end

  # GET /users/:id/private_contacts/1.json
  def show
    begin
      @private_contact = PrivateContact.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      render :nothing => true, :status => 404 unless @private_contact
    end
  end

  # POST /users/:id/private_contacts.json
  def create
    @private_contact = User.find(params[:user_id]).private_contacts.create(params[:private_contact])

    if @private_contact.save
      render json: @private_contact, status: :created, location: user_private_contact_url(@private_contact.user, @private_contact)
    else
      render json: @private_contact.errors, status: :unprocessable_entity
    end
  end

  # PUT /users/:id/private_contacts/1.json
  def update
    @private_contact = PrivateContact.find(params[:id])

    if @private_contact.update_attributes(params[:private_contact])
      render json: @private_contact, status: :ok, location: user_private_contact_url(@private_contact.user, @private_contact)
    else
      render json: @private_contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/:id/private_contacts/1.json
  def destroy
    @private_contact = PrivateContact.find(params[:id])
    @private_contact.destroy

    respond_to do |format|
      head :no_content
    end
  end
end
