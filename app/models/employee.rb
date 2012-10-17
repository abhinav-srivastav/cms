class Employee < ActiveRecord::Base
  acts_as_list

  attr_accessible :about, :designation, :name, :position

  validates_presence_of :name
  # validates_presence_of :about, :designation


end
