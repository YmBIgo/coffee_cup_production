class AddColumnAmountToUsers < ActiveRecord::Migration

  def self.up
    add_column :users,      :amount_money,    :integer, default: 0, null: false
    add_column :viewlists,  :page_path,       :string,  default: "no data", null: false
  end

  def self.down
    remove_column :users,      :amount_money,    :integer, default: 0, null: false
    remove_column :viewlists,  :page_path,       :string,  default: "no data", null: false
  end

end
