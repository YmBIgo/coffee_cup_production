class AddMoneyToUsers < ActiveRecord::Migration

  def self.up
    add_column :users, :money_amount, :integer
    add_column :users, :month_amount, :integer
  end

  def self.down
    remove_column :users, :money_amount, :integer
    remove_column :users, :month_amount, :integer
  end

end
