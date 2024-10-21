#TODO: Create a model for Student with the following attributes: first_name, last_name, email, major, and graduation_date.
#The system should validate that the school_email follows the format name@msudenver.edu. 
class Student < ApplicationRecord
    VALID_MAJORS = %w[Computer\ Science Cybersecurity Data\ Science Computer\ Engineering].freeze
    has_one_attached :profile_picture, dependent: :purge_later
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :school_email, presence: true
    validates :school_email, format: { with: /\A[a-zA-Z0-9_.+-]+@msudenver.edu\z/, message: "must be a valid MSU Denver email" }
    validates :major, presence: true
    validates :graduation_date, presence: true
    validates :graduation_date, format: { with: /\d{4}-\d{2}-\d{2}/, message: "must be in the format YYYY-MM-DD" }
    validates :school_email, uniqueness: true
end
