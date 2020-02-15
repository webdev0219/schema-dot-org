# frozen_string_literal: true

require 'date'
require 'schema_dot_org'

# Model the Schema.org `Thing > Place`.  See https://schema.org/Offer
#
module SchemaDotOrg
  class Offer < SchemaType
    attr_accessor :priceCurrency,
                  :price,
                  :availability,
                  :url,
                  :category,
                  :valid_from

    validates :priceCurrency,       type: String
    validates :price,               type: Numeric
    validates :availability,        type: String
    validates :url,                 type: String, allow_nil: true
    validates :valid_from,          type: Date

    def _to_json_struct
      {
        "price"             => price,
        "priceCurrency"     => priceCurrency,
        "availability"      => availability,
        "url"               => url,
        "category"          => category,
        "validFrom"         => valid_from
      }
    end
  end
end
