class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|

      t.string     :name,              null: false,   default: ""
      t.string     :log_name,          null: false,   default: "qwerty1234"
      t.string     :password,          null: false,   default: "poiuyt0987"
      t.integer    :user_id,           null: false,   default: 0
      t.string     :sign_in_ip,        null: false,   default: ""

      t.timestamps null: false

    end
  end
end
