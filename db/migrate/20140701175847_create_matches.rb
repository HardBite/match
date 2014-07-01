class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :host
      t.integer :host_score
      t.string :guest
      t.integer :guest_score
      t.date :day
      t.text :description 
      t.integer :voted
      t.float :rating

      t.timestamps
    end
  end
end
