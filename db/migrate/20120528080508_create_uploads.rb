class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :filename
      t.string :filetype

      t.timestamps
    end
  end
end
