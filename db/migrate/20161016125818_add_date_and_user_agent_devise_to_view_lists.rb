class AddDateAndUserAgentDeviseToViewLists < ActiveRecord::Migration

  def self.up
    # add columns to viewlists
    add_column :viewlists,      :created_date,      :integer, null: false, default: "no data"
    add_column :viewlists,      :user_agent_devise, :string, null: false, default: "no data"
    # change column users
    change_column :users,       :sex,               :integer, null: false, default: 0
    change_column :users,       :prefecture,        :string, null: false, default: "no data"
    change_column :users,       :company_name,      :string, null: false, default: "no data"
    change_column :users,       :phone_number,      :string, null: false, default: "no data"
    change_column :users,       :family_name,       :string, null: false, default: "no data"
    change_column :users,       :first_name,        :string, null: false, default: "no data"
    change_column :users,       :birth_year,        :integer, null: false, default: "no data"
  end

  def self.down
    # add columns to viewlists
    remove_column :viewlists,   :created_date,      :integer
    remove_column :viewlists,   :user_agent_devise, :string
    # change column users
    change_column :users,       :sex,               :integer, null: false
    change_column :users,       :prefecture,        :string, null: false
    change_column :users,       :company_name,      :string, null: false
    change_column :users,       :phone_number,      :string, null: false
    change_column :users,       :family_name,       :string, null: false
    change_column :users,       :first_name,        :string, null: false
    change_column :users,       :birth_year,        :integer
  end

end
