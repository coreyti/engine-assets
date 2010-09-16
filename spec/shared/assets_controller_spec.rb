require 'spec/spec_helper'

begin
  shared_examples_for "A controller acting as an AssetsController" do
  # describe "A controller acting as an AssetsController", :shared => true do
    attr_reader :format

    # integrate_views
    # 
    # before do
    #   load_view_fixtures(@controller.class)
    # end
    # 
    # describe "response" do
    #   context "with a matching file found in 'public'" do
    #     it "renders that file" do
    #       get :show, :path => 'dual', :format => format
    #       response.body.should match("dual.#{format}, should be rendered")
    #     end
    #   end
    # 
    #   context "with a matching file found in 'app'" do
    #     it "renders that file" do
    #       get :show, :path => 'solo', :format => format
    #       response.body.should match("solo.#{format}.erb, should be rendered")
    #     end
    #   end
    # 
    #   context "without a matching file" do
    #     it "renders 404" do
    #       get :show, :path => 'none', :format => format
    #       response.response_code.should == 404 
    #     end
    #   end
    # end
  end
rescue ArgumentError
  puts "WARNING: #{__FILE__}:#{__LINE__} trying to load this file twice, for some reason"
end