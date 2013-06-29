require 'spec_helper'

describe "Scrambles" do
  describe "GET /scrambles" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get scrambles_path
      response.status.should be(200)
    end
  end
end
