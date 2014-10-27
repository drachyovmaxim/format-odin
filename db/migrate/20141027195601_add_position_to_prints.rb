class AddPositionToPrints < ActiveRecord::Migration
  def change
    add_column :prints, :position, :integer
  end
end
