class EmailsController < ApplicationController
#   before_action :set_email, only: %i[ show edit update destroy ]

  def index
    @emails = Email.all
  end

  def new
    @email = Email.new
  end

  def show
    @email = Email.find(params[:id])
  end

  def create
    @email = Email.new(object: Faker::Movies::StarWars.quote, body: Faker::Quote.yoda)

    respond_to do |format|
      # format.html { redirect_to books_path }
      format.js { }
    end
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
