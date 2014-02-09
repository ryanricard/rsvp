module Rsvp
  class Salutation::WidowerAndFamily < Salutation
    def male
      family.people.adult_males.first
    end
    def template
      "Mr. [[male__first_name]] [[male__last_name]] and Family"
    end
  end
end