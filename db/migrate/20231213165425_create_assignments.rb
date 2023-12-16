# frozen_string_literal: true

# Create Assignment
class CreateAssignments < ActiveRecord::Migration[7.1]
  def change
    create_table :assignments do |t|
      t.string :name, :description, :module, :lecturer, :status
      t.datetime :due_date
      t.float :weighting
      t.boolean :submitted
      t.timestamps
    end
  end
end
