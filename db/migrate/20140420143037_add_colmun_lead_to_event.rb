class AddColmunLeadToEvent < ActiveRecord::Migration
  def change
    add_column :events, :lead, :string, after: :title
  end
end
