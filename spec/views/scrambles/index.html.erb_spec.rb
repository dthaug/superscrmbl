require 'spec_helper'

describe "scrambles/index" do
  before(:each) do
    assign(:scrambles, [
      stub_model(Scramble,
        :title => "Title",
        :price => 1,
        :description => "Description"
      ),
      stub_model(Scramble,
        :title => "Title",
        :price => 1,
        :description => "Description"
      )
    ])
  end

  it "renders a list of scrambles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
