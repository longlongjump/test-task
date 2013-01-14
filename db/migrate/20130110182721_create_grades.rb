class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.references :course
      t.references :student
      t.integer :value
      t.timestamps
    end
  end
end
