class BoardSerializer
  include JSONAPI::Serializer
  attributes :id, :board_properties
end
