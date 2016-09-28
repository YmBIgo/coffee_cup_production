class AddColumnToListviews < ActiveRecord::Migration

  def self.up
    add_column :viewlists, :watching_ip, :string
  end

  def self.down
    remove_column :viewlists, :watching_ip, :string
  end

end
