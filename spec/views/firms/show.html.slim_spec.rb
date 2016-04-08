require 'rails_helper'

RSpec.describe "firms/show", type: :view do
  before(:each) do
    @firm = assign(:firm, Firm.create!(
      :name => "Name",
      :status => "Status",
      :juristiction => "Juristiction",
      :registration_status => "Registration Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/Juristiction/)
    expect(rendered).to match(/Registration Status/)
  end
end
