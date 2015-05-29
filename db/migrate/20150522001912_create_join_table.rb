class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :users, :sections, id: false do |t|
       t.index [:user_id, :section_id]
       t.index [:section_id, :user_id]
    end
  end
end
