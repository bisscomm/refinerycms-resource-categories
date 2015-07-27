module Refinery
  module Admin
    module ResourceCategoriesHelper
      # We show the title from the next available locale
      # if there is no title for the current locale
      def resource_category_title_with_translations(resource_category)
        resource_category.title.presence || resource_category.translations.detect { |t| t.title.present?}.title
      end

    end
  end
end