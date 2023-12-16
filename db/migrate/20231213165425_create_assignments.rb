class CreateAssignments < ActiveRecord::Migration[7.1]
  def change
    create_table :assignments do |t|
      t.string :name
      t.string :description
      t.string :module
      t.string :lecturer
      t.datetime :due_date
      t.float :weighting
      t.string :status
      t.boolean :submitted

      t.timestamps
    end
  end
end
