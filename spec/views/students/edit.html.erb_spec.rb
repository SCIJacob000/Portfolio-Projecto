require 'rails_helper'

RSpec.describe "students/edit", type: :view do
  let(:student) {
    Student.create!(
      name: "MyString",
      school_email: "MyString",
      major: "MyString",
      minor: "MyString"
    )
  }

  before(:each) do
    assign(:student, student)
  end

  it "renders the edit student form" do
    render

    assert_select "form[action=?][method=?]", student_path(student), "post" do

      assert_select "input[name=?]", "student[name]"

      assert_select "input[name=?]", "student[school_email]"

      assert_select "input[name=?]", "student[major]"

      assert_select "input[name=?]", "student[minor]"
    end
  end
end
