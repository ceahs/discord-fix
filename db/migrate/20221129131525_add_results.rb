class AddResults < ActiveRecord::Migration[6.0]
  def change
    add_column :polls, :result1, :integer
    add_column :polls, :result2, :integer
    add_column :polls, :result3, :integer
    add_column :polls, :result4, :integer
  end
end
