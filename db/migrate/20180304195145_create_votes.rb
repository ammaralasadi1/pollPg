class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.string :title
      t.integer :count
      t.string :user

      t.timestamps
    end
  end
end
