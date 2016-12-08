class CreateClosings < ActiveRecord::Migration
  def change
    create_table :closings do |t|

      t.integer    :user_id, null: false, default: 0
      t.integer    :created_month, null: false, default: 0
      t.integer    :created_date, null: false, default: 0
      t.integer    :paid_money, null: false, default: 0
      t.boolean    :income, null: false, default: true

      t.timestamps null: false
    end
  end
end
