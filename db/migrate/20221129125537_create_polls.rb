class CreatePolls < ActiveRecord::Migration[6.0]
  def change
    create_table :polls do |t|
      t.string :title
      t.string :question1
      t.string :question2
      t.string :question3
      t.string :question4
      t.timestamps
    end
  end
end
