module RefineryResourceCategoriesResourcesControllerDecorator
  # before_filter :find_all_categories, :only => [:new, :edit, :create, :update]

  # before_filter :check_category_ids, :only => :update

  protected

  def resource_params
    # update only supports a single file, create supports many.
    if action_name == 'update'
      params.require(:resource).permit(:resource_title, :file, :category_ids)
    else
      params.require(:resource).permit(:resource_title, :file => [], :category_ids => [])
    end


    # params[:page][:images_attributes]={} if params[:page][:images_attributes].nil?
    # super <<  [images_attributes: [:id, :caption, :image_page_id]]
  end

  # def find_all_categories
  #   @categories = Refinery::ResourceCategory.all
  # end

  # def check_category_ids
  #   resource_params[:category_ids] ||= []
  # end
end

Refinery::Admin::PagesController.send :prepend, RefineryResourceCategoriesResourcesControllerDecorator