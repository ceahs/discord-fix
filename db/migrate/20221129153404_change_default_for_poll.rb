class ChangeDefaultForPoll < ActiveRecord::Migration[6.0]
  def change
    change_column :polls, :result1, :integer, :default => 0
    change_column :polls, :result2, :integer, :default => 0
    change_column :polls, :result3, :integer, :default => 0
    change_column :polls, :result4, :integer, :default => 0
  end
end
