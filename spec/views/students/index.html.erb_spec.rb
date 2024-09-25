require 'rails_helper'

RSpec.describe "students/index", type: :view do
  before(:each) do
    assign(:students, [
      Student.create!(
        name: "Name",
        school_email: "School Email",
        major: "Major",
        minor: "Minor"
      ),
      Student.create!(
        name: "Name",
        school_email: "School Email",
        major: "Major",
        minor: "Minor"
      )
    ])
  end

  it "renders a list of students" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("School Email".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Major".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Minor".to_s), count: 2
  end
end
