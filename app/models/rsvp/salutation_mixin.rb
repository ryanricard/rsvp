module Rsvp
  module SalutationMixin
    extend ActiveSupport::Concern
    included do
      attr_accessible :salutation_type, :salutation
      after_save :generate_salutation

      validates :salutation_type, :presence => true
    end

    def salutation_type=(klass)
      write_attribute(:salutation_type, klass.to_s)
    end

    def salutation_type
      read_attribute(:salutation_type).try(:constantize)
    end

    def generate_salutation
      salutation = read_attribute(:salutation)
      if salutation.blank? && salutation_type.present?
        begin
          write_attribute(:salutation, salutation_type.try(:new, family).to_s)
          self.save(callbacks: false)
        rescue
          # Trap exceptions thrown due to incomplete data structures
        end
      end
    end
  end
end