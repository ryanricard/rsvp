module Rsvp
  class Salutation::SingleFemaleAndGuest < Salutation
    def female
      family.people.adult_females.first
    end
    def template
      "Ms. [[female__first_name]] [[female__last_name]] and Guest"
    end
  end
end