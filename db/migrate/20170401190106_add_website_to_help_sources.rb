class AddWebsiteToHelpSources < ActiveRecord::Migration[5.0]
  def change
    add_column :help_sources, :website, :string
  end
end
