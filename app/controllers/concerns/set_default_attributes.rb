module SetDefaultAttributes
  extend ActiveSupport::Concern

  included do
    before_action :set_default_attributes
  end


    def set_default_attributes
      @page_header = "Dev Camp Blog"
      @seo_keywords = "Blogs Portfolios"
    end
end


