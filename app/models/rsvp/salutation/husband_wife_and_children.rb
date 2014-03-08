module Rsvp
  class Salutation::HusbandWifeAndChildren < Salutation
    def male
      family.people.adult_males.first
    end
    def children
      names = ""
      children = family.people.children
      children.each_with_index do |child, index|
        names << " and" if children.size > 1 && (index + 1) == children.size
        names << " #{child.first_name}"
      end
      names.strip
    end
    def template
      "Mr. and Mrs. [[male__first_name]] [[male__last_name]], [[children]]"
    end
  end
end