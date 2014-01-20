class CreateRsvpResponses < ActiveRecord::Migration
  def change
    create_table :rsvp_responses do |t|
      t.integer :invitation_id
      t.string :email, :limit => 50
      t.integer :total_attending
      t.text :comment

      t.timestamps
    end
  end
end
