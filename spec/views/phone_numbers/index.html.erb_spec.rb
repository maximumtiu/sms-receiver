require 'rails_helper'

RSpec.describe "phone_numbers/index", type: :view do
  before(:each) do
    assign(:phone_numbers, [
      PhoneNumber.create!(
        e164_number: "E164 Number",
        twilio_sid: "Twilio Sid"
      ),
      PhoneNumber.create!(
        e164_number: "E164 Number",
        twilio_sid: "Twilio Sid"
      )
    ])
  end

  it "renders a list of phone_numbers" do
    render
    assert_select "tr>td", text: "E164 Number".to_s, count: 2
    assert_select "tr>td", text: "Twilio Sid".to_s, count: 2
  end
end
