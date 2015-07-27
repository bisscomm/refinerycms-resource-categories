module Refinery
  module ResourceCategories
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::ResourceCategories

      engine_name :refinery_resource_categories

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "resource_categories"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.admin_resource_categories_path }
          plugin.pathname = root
          plugin.hide_from_menu = true
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::ResourceCategories)
      end
    end
  end
end
