class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :consejero_id
      t.integer :alumno_id
      t.datetime :fecha
      t.string :estado
      t.text :reporte

      t.timestamps null: false
    end
  end
end
