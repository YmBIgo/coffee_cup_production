class AddColumnPictureurlToCompany < ActiveRecord::Migration

  def self.up
    add_column    :companies,     :picture_url,     :string, :default => "", :null => false
  end

  def self.down
    remove_column :companies,     :picture_url,     :string, :default => "", :null => false
  end

end
