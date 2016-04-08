require 'rails_helper'

RSpec.describe "individuals/show", type: :view do
  before(:each) do
    @individual = assign(:individual, Individual.create!(
      :name => "Name",
      :employer => "Employer",
      :IARD => "Iard",
      :result => "Result",
      :CRD => "Crd"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Employer/)
    expect(rendered).to match(/Iard/)
    expect(rendered).to match(/Result/)
    expect(rendered).to match(/Crd/)
  end
end
