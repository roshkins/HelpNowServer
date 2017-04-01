class CreateHelpSources < ActiveRecord::Migration[5.0]
  def change
    create_table :help_sources do |t|
      t.string :help_name
      t.string :help_phone
      t.string :description

      t.timestamps
    end
  end
end
