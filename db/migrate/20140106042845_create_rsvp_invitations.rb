class CreateRsvpInvitations < ActiveRecord::Migration
  def change
    create_table :rsvp_invitations do |t|
      t.integer :family_id
      t.string :rsvp_code, :limit => 20
      t.integer :total_invited

      t.timestamps
    end

    add_index :rsvp_invitations, :rsvp_code, :unique => true
  end
end
