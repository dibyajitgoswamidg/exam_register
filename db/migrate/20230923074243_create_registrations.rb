class CreateRegistrations < ActiveRecord::Migration[7.0]
  def change
    create_table :registrations do |t|
      t.references :user
      t.references :exam
      t.datetime :start_time

      t.timestamps
    end
  end
end
