require 'spec_helper'

describe "scrambles/new" do
  before(:each) do
    assign(:scramble, stub_model(Scramble,
      :title => "MyString",
      :price => 1,
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new scramble form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", scrambles_path, "post" do
      assert_select "input#scramble_title[name=?]", "scramble[title]"
      assert_select "input#scramble_price[name=?]", "scramble[price]"
      assert_select "input#scramble_description[name=?]", "scramble[description]"
    end
  end
end
