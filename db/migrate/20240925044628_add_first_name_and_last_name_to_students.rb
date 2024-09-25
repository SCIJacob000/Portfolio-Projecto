class AddFirstNameAndLastNameToStudents < ActiveRecord::Migration[7.1]
  def change
    add_column :students, :last_name, :string
  end
end
