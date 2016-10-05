class RemoveColumnPageIdViewlists < ActiveRecord::Migration

  def self.up
    remove_column :viewlists, :page_id, :string
    change_column :users, :start_time, :time, :default => "00:00"
    change_column :users, :end_time, :time, :default => "24:00"
  end
  def self.down
    add_column :viewlists, :page_id, :string
    change_column :users, :start_time, :time, :default => "18:00"
    change_column :users, :end_time, :time, :default => "23:00"
  end

end
