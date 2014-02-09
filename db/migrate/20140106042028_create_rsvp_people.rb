class CreateRsvpPeople < ActiveRecord::Migration
  def change
    create_table :rsvp_people do |t|
      t.string :gender_type, :limit => 50
      t.string :first_name, :limit => 50
      t.string :last_name, :limit => 50
      t.string :suffix, :limit => 15

      t.timestamps
    end
  end
end
