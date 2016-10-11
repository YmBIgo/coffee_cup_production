class ChangeColumnViewlistUserAgent < ActiveRecord::Migration

  def self.up
    change_column :viewlists, :referer,     :string, :default => "no", :null => false
    add_column    :viewlists, :user_agent,  :string, :default => "no data", :null => false
  end

  def self.down
    change_column :viewlists, :referer,    :string, :default => "no"
    remove_column :viewlists, :user_agent, :string, :default => "no data", :null => false
  end

end
