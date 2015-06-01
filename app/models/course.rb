class Course < ActiveRecord::Base
  has_many :sections ,inverse_of: :course, dependent: :destroy
  has_many :comments
  has_and_belongs_to_many :users, :join_table => :courses_users
  accepts_nested_attributes_for :sections
end
