require 'refinerycms-core'

module Refinery
  autoload :ResourceCategoriesGenerator, 'generators/refinery/resource_categories_generator'

  module ResourceCategories
    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end

      def attach!
        require 'refinery/resource'
        require 'refinery/resource_categories/extension'

        Refinery::Resource.send :has_many_resource_categories
      end
    end

    require 'refinery/resource_categories/engine'
  end
end
