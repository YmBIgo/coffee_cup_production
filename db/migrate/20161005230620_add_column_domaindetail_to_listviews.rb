class AddColumnDomaindetailToListviews < ActiveRecord::Migration

  def self.up
    add_column :viewlists, :host_name,     :string
    add_column :viewlists, :isp,           :string
    add_column :viewlists, :organization,  :string
    add_column :viewlists, :country,       :string
    add_column :viewlists, :region,        :string
    add_column :viewlists, :coordinate,    :string
  end

  def self.down
    remove_column :viewlists, :host_name,     :string
    remove_column :viewlists, :isp,           :string
    remove_column :viewlists, :organization,  :string
    remove_column :viewlists, :country,       :string
    remove_column :viewlists, :region,        :string
    remove_column :viewlists, :coordinate,    :string
  end

end
