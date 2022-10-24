class EmailsController < ApplicationController
#   before_action :set_email, only: %i[ show edit update destroy ]

  def index
    @emails = Email.all
  end

  def new
    @email = Email.new
  end

  def create
    @email = Email.new(email_params)

    # respond_to do |format|
      if @email.save
    # only html format for now, as we are not making AJAX requests yet:
        redirect_to root_path
        flash[:notice] = "Email successfully created" 

      # format.json { ... } would be here

      else
      # format.html { ... } would be here instead of the 2 following lines:
        redirect_to root_path
        flash[:notice] = "Error in creating new Email" 

      # format.json { ... } would be here
      end
    # end
  end

  def edit
    @email = Email.find(params[:id])
  end

  def update
    @email = Email.find(params[:id])
    @email.update(email_params)
    redirect_to root_path
    flash[:notice] = "Email successfully updated"
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    redirect_to root_path
    flash[:notice] = "Email successfully deleted"
  end

  private

    def email_params
      params.require(:email).permit(:object, :body)
    end

end
