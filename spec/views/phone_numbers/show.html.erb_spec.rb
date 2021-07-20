require 'rails_helper'

RSpec.describe "phone_numbers/show", type: :view do
  before(:each) do
    @phone_number = assign(:phone_number, PhoneNumber.create!(
      e164_number: "E164 Number",
      twilio_sid: "Twilio Sid"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/E164 Number/)
    expect(rendered).to match(/Twilio Sid/)
  end
end
