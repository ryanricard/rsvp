class CreateRsvpFamilies < ActiveRecord::Migration
  def change
    create_table :rsvp_families do |t|
      t.string :salutation_type, :limit => 50
      t.string :salutation
      t.string :street_1, :limit => 75
      t.string :street_2, :limit => 75
      t.string :city, :limit => 50
      t.string :state, :limit => 25
      t.string :postal_code, :limit => 15

      t.timestamps
    end
  end
end
