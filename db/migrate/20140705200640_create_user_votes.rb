class CreateUserVotes < ActiveRecord::Migration
  def change
    create_table :user_votes do |t|
      t.belongs_to :user
      t.belongs_to :match
      t.integer :vote
      t.timestamps
    end

    remove_column :matches, :voted
      
  end
end
