class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :nombre
      t.text :descripcion
      t.integer :creditos

      t.timestamps null: false
    end
  end
end
