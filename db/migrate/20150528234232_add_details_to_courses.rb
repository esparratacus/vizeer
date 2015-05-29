class AddDetailsToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :dif_sum, :integer, :default =>0
    add_column :courses, :inten_sum, :integer, :default =>0
    add_column :courses, :util_sum, :integer, :default =>0
  end
end
