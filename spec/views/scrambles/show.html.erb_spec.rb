require 'spec_helper'

describe "scrambles/show" do
  before(:each) do
    @scramble = assign(:scramble, stub_model(Scramble,
      :title => "Title",
      :price => 1,
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/1/)
    rendered.should match(/Description/)
  end
end
