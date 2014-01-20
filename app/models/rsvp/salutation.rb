module Rsvp
  class Salutation < ActiveRecord::Base
    belongs_to :family

    def template
      raise "Template not implemented in subclass."
    end

    def to_s
      merge
    end

    private

    def merge
      salutation = template
      template.scan(/\[\[\w*\]\]/).each do |expression|
        salutation_method, person_method = expression.tr("][", "").split(/__/)
        salutation.gsub!(expression, send(salutation_method).send(person_method))
      end
      salutation
    end
  end
end
