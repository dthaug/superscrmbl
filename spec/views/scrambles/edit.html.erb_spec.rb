require 'spec_helper'

describe "scrambles/edit" do
  before(:each) do
    @scramble = assign(:scramble, stub_model(Scramble,
      :title => "MyString",
      :price => 1,
      :description => "MyString"
    ))
  end

  it "renders the edit scramble form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", scramble_path(@scramble), "post" do
      assert_select "input#scramble_title[name=?]", "scramble[title]"
      assert_select "input#scramble_price[name=?]", "scramble[price]"
      assert_select "input#scramble_description[name=?]", "scramble[description]"
    end
  end
end
