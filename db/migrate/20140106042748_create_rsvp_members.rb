class CreateRsvpMembers < ActiveRecord::Migration
  def change
    create_table :rsvp_members do |t|
      t.integer :family_id
      t.integer :person_id

      t.timestamps
    end
  end
end
