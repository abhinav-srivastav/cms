require 'spec_helper'

describe Product do 
	before do
    @pro = Product.new(:name => "Apple", :description => "dn't knw what", :active_content => 1 )
  end


  describe "Validation" do 
    before do
      @pro.should be_valid
    end
  
    it "should have a name" do
      @pro.name = nil
      @pro.should_not be_valid
    end

  end
end