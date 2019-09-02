require 'rails_helper'

RSpec.describe "customers/edit", type: :view do
  before(:each) do
    @customer = assign(:customer, Customer.create!(
      :name => "MyString",
      :phone => "MyString",
      :description => "MyString",
      :banned => false
    ))
  end

  it "renders the edit customer form" do
    render

    assert_select "form[action=?][method=?]", customer_path(@customer), "post" do

      assert_select "input[name=?]", "customer[name]"

      assert_select "input[name=?]", "customer[phone]"

      assert_select "input[name=?]", "customer[description]"

      assert_select "input[name=?]", "customer[banned]"
    end
  end
end
