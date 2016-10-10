class AddColumnRefererToViewlist < ActiveRecord::Migration

  def self.up
    add_column :viewlists, :referer,     :string, :default => "no"
  end

  def self.down
    remove_column :viewlists, :referer,  :string, :default => "no"
  end

end
