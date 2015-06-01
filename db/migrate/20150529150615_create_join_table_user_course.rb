class CreateJoinTableUserCourse < ActiveRecord::Migration
  def change
    create_join_table :users, :courses, id: false do |t|
      # t.index [:user_id, :course_id]
      # t.index [:course_id, :user_id]
    end
  end
end
