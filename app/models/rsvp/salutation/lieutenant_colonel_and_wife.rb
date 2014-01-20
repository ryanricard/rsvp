module Rsvp
  class Salutation::LieutenantColonelAndWife < Salutation
    def male
      family.people.adult_males.first
    end
    def template
      "Lt. Col. and Mrs. [[male__first_name]] [[male__last_name]]"
    end
  end
end