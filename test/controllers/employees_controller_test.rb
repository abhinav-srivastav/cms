require "minitest_helper"
require "minitest/spec"

class EmployeesControllerTest < MiniTest::Rails::ActionController::TestCase
    def do_new
    	get :new
    end
    test "should get new" do
    	Employee.should_receive(:new).and_return(@employee)
    	do_new
    	response.should be_success
  	end
end
