require 'rails_helper'

RSpec.describe "phone_numbers/new", type: :view do
  before(:each) do
    assign(:phone_number, PhoneNumber.new(
      e164_number: "MyString",
      twilio_sid: "MyString"
    ))
  end

  it "renders new phone_number form" do
    render

    assert_select "form[action=?][method=?]", phone_numbers_path, "post" do

      assert_select "input[name=?]", "phone_number[e164_number]"

      assert_select "input[name=?]", "phone_number[twilio_sid]"
    end
  end
end
