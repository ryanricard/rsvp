module Rsvp
  class Salutation::WidowAndFamily < Salutation
    def female
      family.people.adult_females.first
    end
    def template
      "Mrs. [[female__first_name]] [[female__last_name]] and Family"
    end
  end
end