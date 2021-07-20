class WebhookController < ApplicationController
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
        format.json { head 200 }
      else
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end
end
