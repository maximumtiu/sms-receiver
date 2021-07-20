class WebhookController < ApplicationController
  before_action :authorize_twilio, only: :twilio

  # inbound twilio sms
  def twilio
    @message= Message.new(
      sid: params['SmsSid'],
      to: params['To'],
      from: params['From'],
      body: params['Body']
    )

    respond_to do |format|
      if @message.save
        format.xml { head 200 }
      else
        format.xml { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def authorize_twilio
    head 403 unless User.find_by(twilio_account_sid: params['AccountSid'])
  end
end
