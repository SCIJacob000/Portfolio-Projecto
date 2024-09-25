require 'rails_helper'

RSpec.describe "students/new", type: :view do
  before(:each) do
    assign(:student, Student.new(
      name: "MyString",
      school_email: "MyString",
      major: "MyString",
      minor: "MyString"
    ))
  end

  it "renders new student form" do
    render

    assert_select "form[action=?][method=?]", students_path, "post" do

      assert_select "input[name=?]", "student[name]"

      assert_select "input[name=?]", "student[school_email]"

      assert_select "input[name=?]", "student[major]"

      assert_select "input[name=?]", "student[minor]"
    end
  end
end
