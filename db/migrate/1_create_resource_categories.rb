class CreateResourceCategories < ActiveRecord::Migration

  def up
    create_table :refinery_resource_categories do |t|
      t.integer :position

      t.timestamps
    end

    add_index :refinery_resource_categories, :id

    Refinery::ResourceCategory.create_translation_table! :title => :string


    create_table :refinery_resource_categorizations, :id => false do |t|
      t.integer :resource_id
      t.integer :category_id
      t.integer :position

      t.timestamps
    end

    add_index :refinery_resource_categorizations, :resource_id
    add_index :refinery_resource_categorizations, :category_id

  end

  def down
    drop_table :refinery_resource_categories
    drop_table :refinery_resource_categorizations

    Refinery::ResourceCategory.drop_translation_table!
    Refinery::UserPlugin.destroy_all({:name => "refinery_resource_categories"})
  end
end