require 'rails_helper'

RSpec.describe "individuals/index", type: :view do
  before(:each) do
    assign(:individuals, [
      Individual.create!(
        :name => "Name",
        :employer => "Employer",
        :IARD => "Iard",
        :result => "Result",
        :CRD => "Crd"
      ),
      Individual.create!(
        :name => "Name",
        :employer => "Employer",
        :IARD => "Iard",
        :result => "Result",
        :CRD => "Crd"
      )
    ])
  end

  it "renders a list of individuals" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Employer".to_s, :count => 2
    assert_select "tr>td", :text => "Iard".to_s, :count => 2
    assert_select "tr>td", :text => "Result".to_s, :count => 2
    assert_select "tr>td", :text => "Crd".to_s, :count => 2
  end
end
