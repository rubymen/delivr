class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :model
      t.boolean :admin_read
      t.boolean :admin_create
      t.boolean :admin_update
      t.boolean :admin_delete
      t.boolean :manager_read
      t.boolean :manager_create
      t.boolean :manager_update
      t.boolean :manager_delete
      t.boolean :member_read
      t.boolean :member_create
      t.boolean :member_update
      t.boolean :member_delete

      t.timestamps
    end
  end
end
