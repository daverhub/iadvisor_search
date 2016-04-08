require 'rails_helper'

RSpec.describe "firms/new", type: :view do
  before(:each) do
    assign(:firm, Firm.new(
      :name => "MyString",
      :status => "MyString",
      :juristiction => "MyString",
      :registration_status => "MyString"
    ))
  end

  it "renders new firm form" do
    render

    assert_select "form[action=?][method=?]", firms_path, "post" do

      assert_select "input#firm_name[name=?]", "firm[name]"

      assert_select "input#firm_status[name=?]", "firm[status]"

      assert_select "input#firm_juristiction[name=?]", "firm[juristiction]"

      assert_select "input#firm_registration_status[name=?]", "firm[registration_status]"
    end
  end
end
