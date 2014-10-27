class ChangeOrderCommentToText < ActiveRecord::Migration
  def change
    change_column :orders, :comment, :text
  end
end
