# -*- encoding: us-ascii -*-

require File.expand_path('../../../../spec_helper', __FILE__)

ruby_version_is "1.9" do
  describe "Enumerator::Generator#initialize" do
    before(:each) do
      @class = enumerator_class::Generator
      @uninitialized = @class.allocate
    end

    it "is a private method" do
      @class.should have_private_instance_method(:initialize, false)
    end

    it "returns self when given a block" do
      @uninitialized.send(:initialize) {}.should equal(@uninitialized)
    end

    describe "on frozen instance" do
      ruby_version_is "2.1" do
        it "raises a RuntimeError" do
          lambda {
            @uninitialized.freeze.send(:initialize) {}
          }.should raise_error(RuntimeError)
        end
      end
    end
  end
end
