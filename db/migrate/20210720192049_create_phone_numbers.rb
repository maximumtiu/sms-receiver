class CreatePhoneNumbers < ActiveRecord::Migration[6.1]
  def change
    create_table :phone_numbers do |t|
      t.string :e164_number
      t.string :twilio_sid
      t.string :country

      t.timestamps
    end
  end
end
