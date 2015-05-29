class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.references :course, index: true
      t.string :semestre
      t.boolean :estado

      t.timestamps null: false
    end
    add_foreign_key :sections, :courses
  end
end
