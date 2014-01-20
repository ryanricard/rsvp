module Rsvp
  class Salutation::Widow < Salutation
    def female
      family.people.adult_females.first
    end
    def template
      "Mrs. [[female__first_name]] [[female__last_name]]"
    end
  end
end