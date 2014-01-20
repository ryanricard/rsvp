class CreateRsvpSalutations < ActiveRecord::Migration
  def change
    create_table :rsvp_salutations do |t|
      t.integer :family_id
      t.string :type, :limit => 50

      t.timestamps
    end
  end
end
