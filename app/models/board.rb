# == Schema Information
#
# Table name: boards
#
#  id               :bigint           not null, primary key
#  board_properties :jsonb            not null
#
class Board < ApplicationRecord
  JSON_SCHEMA = Rails.root.join("app", "models", "schemas", "board.json").to_s

  store_accessor :product_attributes, %w[strips]
  validates :board_properties, presence: true, json: { schema: JSON_SCHEMA }
end
