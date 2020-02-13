# frozen_string_literal: true
require 'schema_dot_org'

# Model the Schema.org `Thing > Place`.  See https://schema.org/Offer
#
module SchemaDotOrg
  class Thing < SchemaType
    attr_accessor :name,
                  :description,
                  :image,
                  :url

    validates :name,          type: String
    validates :description,   type: String
    validates :image,         type: String, allow_nil: true
    validates :url,           type: String, allow_nil: true

    def _to_json_struct
      {
        "name" => name,
        "description" => description,
        "image" => image,
        "url" => url
      }
    end
  end
end
