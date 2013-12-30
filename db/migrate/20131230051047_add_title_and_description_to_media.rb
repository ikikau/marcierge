class AddTitleAndDescriptionToMedia < ActiveRecord::Migration
  def change
    add_column :media, :title, :string
    add_column :media, :description, :text
  end
end
