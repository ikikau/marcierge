class CreateMasterPrefectures < ActiveRecord::Migration
  def change
    create_table :master_prefectures do |t|
      t.string :name
      t.integer :sort
    end
  end
end
