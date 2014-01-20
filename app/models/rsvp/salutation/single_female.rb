module Rsvp
  class Salutation::SingleFemale < Salutation
    def female
      family.people.adult_females.first
    end
    def template
      "Ms. [[female__first_name]] [[female__last_name]]"
    end
  end
end