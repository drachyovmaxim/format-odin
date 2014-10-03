class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :print_id
      t.string  :email
      t.string  :name
      t.string  :address
      t.string  :comment
      t.string  :phone
      t.string  :ip
      t.timestamps
    end
  end
end
