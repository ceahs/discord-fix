class AddForiegnKey < ActiveRecord::Migration[6.0]
  def change
    add_reference :polls, :user, foreign_key: true
  end
end
