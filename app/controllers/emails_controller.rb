class EmailsController < ApplicationController
  before_action :set_email, only: %i[ show edit update destroy ]

  def index
    @emails = Email.all
  end


  def new
    @email = Email.new
  end


  def create
    @email = Email.create(object: Faker::Movies::StarWars.quote, body: Faker::Quote.yoda)

    if @email.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { }
      end
    end
  end


  def show
    @email.read = true

    # @email.update(body: @email.body) # here it seems that I need to pretend to update something for AJAX to happen
  
    if @email.save 
      respond_to do |format|
        format.html { redirect_to emails_path }
        format.js {}
      end
    end
  end


  def edit
    @email = Email.find(params[:id])
  end


  def update
    @email = Email.find(params[:id])

    if @email.read = true
      @email.update(read: false)
    end

    if @email.save
      respond_to do |format|
        format.html { redirect_to emails_path, notice: "Email status successfully changed." }
        format.js { }
      end
    end

    # redirect_to root_path
    # flash[:notice] = "Email successfully updated"
  end


  def destroy
    @email = Email.find(params[:id])
    @email.destroy

    respond_to do |format|
      format.html { redirect_to emails_path, notice: "Email successfully deleted." }
      format.js {}
    end
  end


  def email_unread_toggle
    @email = Email.find(params[:id])

    if @email.read = false
      @email.update(read: true)
    # elsif @email.read = true
    #   @email.edit(read: false)
    end

    # if @email.save

    #   respond_to do |format|
    #     format.html { redirect_to emails_path, notice: "Email status successfully changed." }
    #     format.js {}
    #   end
    # end

    # redirect_to root_path
    # flash[:notice] = "Email status successfully changed"
  end


  private

    # Use callbacks to share common setup or constraints between actions.
    def set_email
      @email = Email.find(params[:id])
    end


    # Only allow a list of trusted parameters through.
    def email_params
      params.require(:email).permit(:id, :object, :body, :read)
    end


    


end # end of Class EmailsController
