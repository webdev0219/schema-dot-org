# frozen_string_literal: true

require 'date'
require 'schema_dot_org'
require 'schema_dot_org/aggregate_offer'

# Model the Schema.org `Thing > Place`.  See https://schema.org/Product
#
module SchemaDotOrg
  class SportsEvent < SchemaType
    attr_accessor :name,
                  :start_date,
                  :end_date,
                  :url,
                  :description,
                  :location,
                  :image,
                  :offers,
                  :performer

    validates :name,              type: String
    validates :start_date,        type: Date
    validates :end_date,          type: Date, allow_nil: true
    validates :url,               type: String
    validates :description,       type: String, allow_nil: true
    validates :location,          type: SchemaDotOrg::Place
    validates :image,             type: String, allow_nil: true
    validates :offers,            type: SchemaDotOrg::Offer
    validates :performer,         type: String, allow_nil: true


    def _to_json_struct
      {
        "name" => name,
        "startDate" => start_date,
        "endDate" => end_date,
        "url" => url,
        "description" => description,
        "location" => location.to_json_struct,
        "image" => image,
        "offers" => offers.to_json_struct,
        "performer" => performer
      }
    end

    def image
      @image || []
    end
  end
end
#
#
# {
#    "@context": "http://schema.org",
#    "@type": "SportsEvent",
#    "name": "FC Barcelona vs Getafe",
#    "startDate": "2020-02-15T16:00:00",
#    "endDate": null,
#    "url": "https://www.viagogo.co.uk/Sports-Tickets/Football/Spanish-Premier-League/FC-Barcelona-Tickets/E-3876816",
#    "description": null,
#    "location": {
#      "@type": "Place",
#      "name": "Camp Nou",
#      "address": {
#        "@type": "PostalAddress",
#        "addressLocality": "Barcelona",
#        "addressCountry": "Spain"
#      }
#    },
#    "image": null,
#    "offers": {
#      "@type": "Offer",
#      "category": "Secondary",
#      "priceCurrency": "USD",
#      "price": "52.17",
#      "url": "https://www.viagogo.co.uk/Sports-Tickets/Football/Spanish-Premier-League/FC-Barcelona-Tickets/E-3876816",
#      "availability": "http://schema.org/InStock",
#      "validFrom": "2017-01-07T00:00:00"
#    },
#    "performer": null
# }
