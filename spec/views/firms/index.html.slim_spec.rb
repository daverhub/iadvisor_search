require 'rails_helper'

RSpec.describe "firms/index", type: :view do
  before(:each) do
    assign(:firms, [
      Firm.create!(
        :name => "Name",
        :status => "Status",
        :juristiction => "Juristiction",
        :registration_status => "Registration Status"
      ),
      Firm.create!(
        :name => "Name",
        :status => "Status",
        :juristiction => "Juristiction",
        :registration_status => "Registration Status"
      )
    ])
  end

  it "renders a list of firms" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "Juristiction".to_s, :count => 2
    assert_select "tr>td", :text => "Registration Status".to_s, :count => 2
  end
end
