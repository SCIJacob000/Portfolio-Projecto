require 'rails_helper'

RSpec.describe "students/show", type: :view do
  before(:each) do
    assign(:student, Student.create!(
      name: "Name",
      school_email: "School Email",
      major: "Major",
      minor: "Minor"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/School Email/)
    expect(rendered).to match(/Major/)
    expect(rendered).to match(/Minor/)
  end
end
