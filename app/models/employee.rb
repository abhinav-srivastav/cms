class Employee < ActiveRecord::Base
  attr_accessible :about, :designation, :name

  validates_presence_of :name
  # validates_presence_of :about, :designation


end
