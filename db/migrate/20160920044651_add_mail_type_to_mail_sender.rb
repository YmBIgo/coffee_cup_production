class AddMailTypeToMailSender < ActiveRecord::Migration

  def self.up
    add_column :mail_senders, :mail_type, :integer
  end

  def self.down
    remove_column :mail_senders, :mail_type, :integer
  end

end
