require "minitest_helper"

class EmployeeTest < MiniTest::Rails::ActiveSupport::TestCase
  test "validate of empty name " do
   	emp = Employee.new
    refute emp.valid?
  end
  test "validation of name " do
   	emp = Employee.new name: "Abhinav"
    assert emp.valid?
  end

  describe Employee do
    it "can be valid" do
      emp = Employee.new name: "Abhinav"
      assert emp.valid?
      # emp.valid?.must_equal true
    end
  end

  describe Employee do
    it "can be valid" do
      emp = Employee.new 
      emp.valid?.wont_equal true
    end
  end




end
