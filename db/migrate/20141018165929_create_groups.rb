class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :description
      t.datetime :couch_date

      t.timestamps
    end
  end
end
