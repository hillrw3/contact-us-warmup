class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
  end

  def show
    set_contact
  end

  def mew
    @contact = Contact.new
  end

  def edit
    set_contact
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to contacts_url, notice: 'Contact was successfully created.'
    else
      render :new
    end
  end

  def update
   set_contact
    if @contact.update(contact_params)
      redirect_to @contact, notice: 'Contact was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    set_contact
    @contact.destroy
    redirect_to contacts_url, notice: 'Contact was successfully destroyed.'
  end

  def new
    @contact = Contact.new
  end

  private
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params[:contact][:email]
      params[:contact][:name]
      params[:contact][:notes]
      params.require(:contact).permit(:name, :email, :notes)
    end
end
