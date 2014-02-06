module Rsvp
  class Salutation::BoyfriendAndGirlfriend < Salutation
    def male
      family.people.adult_males.first
    end
    def female
      family.people.adult_females.first
    end
    def template
      "Mr. [[male__first_name]] [[male__last_name]] and Ms. [[female__first_name]] [[female__last_name]]"
    end
  end
end