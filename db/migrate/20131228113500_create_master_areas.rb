class CreateMasterAreas < ActiveRecord::Migration
  def change
    create_table :master_areas do |t|
      t.string :name
      t.integer :sort
    end
  end
end
