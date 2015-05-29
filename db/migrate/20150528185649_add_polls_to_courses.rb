class AddPollsToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :intensidad, :decimal , :default =>0
    add_column :courses, :dificultad, :decimal, :default =>0
    add_column :courses, :utilidad, :decimal, :default =>0
    add_column :courses, :numero_encuestas, :integer, :default =>0
  end
end
