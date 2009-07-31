class CreateTelephoneNumbers < ActiveRecord::Migration
  def self.up
    create_table :telephone_numbers do |t|
      t.integer :type
      t.string :value

      t.timestamps
    end
  end

  def self.down
    drop_table :telephone_numbers
  end
end
