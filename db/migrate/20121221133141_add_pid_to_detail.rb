class AddPidToDetail < ActiveRecord::Migration
  def change
    add_column :details, :pid, :integer
  end
end
