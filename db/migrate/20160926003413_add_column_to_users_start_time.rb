class AddColumnToUsersStartTime < ActiveRecord::Migration

  def self.up
    add_column :users, :start_time, :time, :default => "18:00"
    add_column :users, :end_time, :time, :default => "23:00"
  end

  def self.down
    remove_column :users, :start_time, :time
    remove_column :users, :end_time, :time
  end

end
