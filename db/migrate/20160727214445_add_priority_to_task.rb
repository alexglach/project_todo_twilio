class AddPriorityToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :priority, :integer, :unique => true
  end
end
