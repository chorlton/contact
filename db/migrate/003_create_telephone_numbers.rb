class CreateTelephoneNumbers < ActiveRecord::Migration
  def self.up
    create_table :telephone_numbers do |t|
      t.integer :teltype
      t.string :telnum
      t.integer :contact_id

      t.timestamps
    end
  end

  def self.down
    drop_table :telephone_numbers
  end
end
