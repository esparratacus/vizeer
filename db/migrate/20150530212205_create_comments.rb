class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true
      t.references :course, index: true
      t.text :comentario
      t.integer :negativo
      t.integer :positivo
      t.integer :denuncias

      t.timestamps null: false
    end
    add_foreign_key :comments, :users
    add_foreign_key :comments, :courses
  end
end
