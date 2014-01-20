module Rsvp
  class Salutation::SingleMale < Salutation
    def male
      family.people.adult_males.first
    end
    def template
      "Mr. [[male__first_name]] [[male__last_name]]"
    end
  end
end