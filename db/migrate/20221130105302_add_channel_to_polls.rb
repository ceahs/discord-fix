class AddChannelToPolls < ActiveRecord::Migration[6.0]
  def change
    add_column :polls, :channel, :string
    add_column :polls, :message, :string
  end
end
