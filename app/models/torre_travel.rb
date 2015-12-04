class TorreTravel < ActiveRecord::Base
  enum housing: [:house, :flat, :bungalo, :chelet]
  enum distance: [:first_line, :second_line]
  enum lang: [:es, :ru]
end
