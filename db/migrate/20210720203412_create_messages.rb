class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :sid
      t.string :to
      t.string :from
      t.string :body

      t.timestamps
    end
  end
end
