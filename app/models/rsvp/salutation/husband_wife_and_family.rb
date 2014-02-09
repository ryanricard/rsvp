module Rsvp
  class Salutation::HusbandWifeAndFamily < Salutation
    def male
      family.people.adult_males.first
    end
    def template
      "Mr. and Mrs. [[male__first_name]] [[male__last_name]] and Family"
    end
  end
end