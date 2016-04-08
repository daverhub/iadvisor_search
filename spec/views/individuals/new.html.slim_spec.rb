require 'rails_helper'

RSpec.describe "individuals/new", type: :view do
  before(:each) do
    assign(:individual, Individual.new(
      :name => "MyString",
      :employer => "MyString",
      :IARD => "MyString",
      :result => "MyString",
      :CRD => "MyString"
    ))
  end

  it "renders new individual form" do
    render

    assert_select "form[action=?][method=?]", individuals_path, "post" do

      assert_select "input#individual_name[name=?]", "individual[name]"

      assert_select "input#individual_employer[name=?]", "individual[employer]"

      assert_select "input#individual_IARD[name=?]", "individual[IARD]"

      assert_select "input#individual_result[name=?]", "individual[result]"

      assert_select "input#individual_CRD[name=?]", "individual[CRD]"
    end
  end
end
