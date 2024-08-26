class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params.require(:contact).permit(:name, :email, :phone, :message))

    if(@contact.save)
      flash[:success] = 'Your message has been sent.'
      redirect_to action: 'new', status: 303
    else
      render :new, status: :unprocessable_entity
    end
  end
end
