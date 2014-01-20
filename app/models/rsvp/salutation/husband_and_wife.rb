module Rsvp
  class Salutation::HusbandAndWife < Salutation
    def male
      family.people.adult_males.first
    end
    def template
      "Mr. and Mrs. [[male__first_name]] [[male__last_name]]"
    end
  end
end