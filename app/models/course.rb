class Course < ActiveRecord::Base
  has_many :sections ,inverse_of: :course, dependent: :destroy
  accepts_nested_attributes_for :sections
end
