class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :type, index: true
      t.references :category, index: true
      t.date :begin_date
      t.date :end_date
      t.references :user, index: true

      t.timestamps
    end
  end
end
