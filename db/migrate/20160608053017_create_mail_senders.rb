class CreateMailSenders < ActiveRecord::Migration
  def change
    create_table :mail_senders do |t|

      t.string     :email

      t.timestamps null: false

    end
  end
end
