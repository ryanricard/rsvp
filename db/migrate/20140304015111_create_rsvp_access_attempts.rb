class CreateRsvpAccessAttempts < ActiveRecord::Migration
  def change
    create_table :rsvp_access_attempts do |t|
      t.string :remote_ip
      t.integer :failed_attempts, default: 0
      t.datetime :locked_until
      t.integer :locks_incurred, default: 0
      t.timestamps
    end
  end
end
