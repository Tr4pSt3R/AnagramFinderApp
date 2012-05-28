class CreateAnagrams < ActiveRecord::Migration
  def change
    create_table :anagrams do |t|
      t.integer :upload_id
      t.string :word
      t.integer :time_taken

      t.timestamps
    end
  end
end
