module Rsvp
  module SalutationMixin
    def salutation_type=(klass)
      write_attribute(:salutation_type, klass.to_s)
    end

    def salutation_type
      read_attribute(:salutation_type).try(:constantize)
    end

    def salutation
      salutation_type.try(:new, family)
    end
  end
end