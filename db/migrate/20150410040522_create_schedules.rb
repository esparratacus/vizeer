class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.references :user, index: true
      t.string :dia_semana
      t.time :hora_inicio
      t.time :hora_fin

      t.timestamps null: false
    end
    add_foreign_key :schedules, :users
  end
end
