class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :tracker, index: true

      t.timestamps
    end
  end
end
