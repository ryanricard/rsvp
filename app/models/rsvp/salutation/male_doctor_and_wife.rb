module Rsvp
  class Salutation::MaleDoctorAndWife < Salutation
    def male
      family.people.adult_males.first
    end
    def template
      "Dr. and Mrs. [[male__first_name]] [[male__last_name]]"
    end
  end
end