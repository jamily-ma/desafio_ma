class CreateDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :details do |t|
      t.date :birthdate
      t.string :nationality
      t.string :definition
      t.boolean :employee
      t.float :income

      t.timestamps
    end
  end
end
