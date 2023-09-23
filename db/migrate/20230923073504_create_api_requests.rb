class CreateApiRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :api_requests do |t|
      t.string :endpoint
      t.jsonb :payload
      t.text :response

      t.timestamps
    end
  end
end
