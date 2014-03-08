module Rsvp
  class Salutation
    attr_accessor :family

    def initialize(family)
      raise "Salutation class initialization requires a family to be passed." if family.nil?
      @family = family
    end

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
        merge_data = send(salutation_method)
        unless merge_data.class == String
          merge_data = merge_data.send(person_method)
        end
        salutation.gsub!(expression, merge_data)
      end
      salutation
    end
  end
end
