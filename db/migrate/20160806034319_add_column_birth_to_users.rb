class AddColumnBirthToUsers < ActiveRecord::Migration

  def self.up
    add_column :users, :birth_year, :integer
    add_column :users, :age,        :integer
    add_column :users, :study_months, :string
  end

  def self.down
    remove_column :users, :birth_year, :integer
    remove_column :users, :age,        :integer
    remove_column :users, :study_months, :string
  end

end
