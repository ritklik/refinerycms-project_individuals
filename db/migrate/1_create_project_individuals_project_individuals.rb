class CreateProjectIndividualsProjectIndividuals < ActiveRecord::Migration

  def up
    create_table :refinery_project_individuals do |t|
      t.string :name
      t.string :category
      t.integer :image_thumb_id
      t.integer :image_full_id
      t.text :description
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-project_individuals"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/project_individuals/project_individuals"})
    end

    drop_table :refinery_project_individuals

  end

end
