class ChangeColumnType < ActiveRecord::Migration
  def change
    change_column :contacts, :name, :string
  end
end
