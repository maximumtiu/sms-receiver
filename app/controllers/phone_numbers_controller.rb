class PhoneNumbersController < ApplicationController
  before_action :set_phone_number, only: %i[ edit update destroy ]

  # GET /phone_numbers or /phone_numbers.json
  def index
    @phone_numbers = client.incoming_phone_numbers.list
  end

  # GET /phone_numbers/+14044062468
  def show
    phone_number = client.incoming_phone_numbers.list(phone_number: params[:id]).first
    @messages = client.messages.list(to: phone_number.phone_number)
  end

  # GET /phone_numbers/new
  def new
    @phone_number = PhoneNumber.new
  end

  # GET /phone_numbers/1/edit
  def edit
  end

  # POST /phone_numbers or /phone_numbers.json
  def create
    @phone_number = PhoneNumber.new(phone_number_params)

    respond_to do |format|
      if @phone_number.save
        format.html { redirect_to @phone_number, notice: "Phone number was successfully created." }
        format.json { render :show, status: :created, location: @phone_number }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @phone_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phone_numbers/1 or /phone_numbers/1.json
  def update
    respond_to do |format|
      if @phone_number.update(phone_number_params)
        format.html { redirect_to @phone_number, notice: "Phone number was successfully updated." }
        format.json { render :show, status: :ok, location: @phone_number }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @phone_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phone_numbers/1 or /phone_numbers/1.json
  def destroy
    @phone_number.destroy
    respond_to do |format|
      format.html { redirect_to phone_numbers_url, notice: "Phone number was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def client
      Twilio::REST::Client.new current_user.twilio_account_sid, current_user.twilio_auth_token
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_phone_number
      @phone_number = PhoneNumber.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def phone_number_params
      params.require(:phone_number).permit(:e164_number, :twilio_sid)
    end
end
