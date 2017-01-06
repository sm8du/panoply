class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  before_filter :categories, :brands, :line_items

  def line_items
    @line_items = LineItem.all
  end
  def categories
    @categories = Category.all
  end 

  def brands
    @brands = Product.pluck(:brand).sort.uniq!

    if @brands == nil
      @brands=Product.pluck(:brand).sort
    end
  end

  def genders
    @genders = Product.pluck(:gender).sort.uniq!

    if @brands == nil
      @brands=Product.pluck(:gender).sort
    end
  end
end
