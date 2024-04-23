class AddColumnToDetails < ActiveRecord::Migration[7.1]
  def change
      add_column :details, :user_id, :integer
  end
end
