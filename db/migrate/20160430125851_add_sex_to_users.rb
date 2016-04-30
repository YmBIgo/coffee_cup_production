class AddSexToUsers < ActiveRecord::Migration

  def self.up
    add_column :users, :sex, :integer, null: false
    add_column :users, :prefecture, :string, null: false
  end

  def self.down
    remove_column :users, :sex
    remove_column :users, :prefecture
  end

end
