class AddAssociationsBetweenMatchAndPhoto < ActiveRecord::Migration
  def change

    change_table :photos do |t|
      t.belongs_to :match
      t.string :image
    end
  end
end
