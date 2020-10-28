class AddBoard < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.jsonb :board_properties, default: '{}', null: false
    end
  end
end
