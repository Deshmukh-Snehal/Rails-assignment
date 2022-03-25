class ApplicationController < ActionController::Base
  # Pagination Page Number
  def page
    @page ||= params[:page] || 1
  end

  # Pagination Per Page Records
  def per_page
    @per_page ||= params[:per_page] || 40
  end

  ## Returns Datatable Page Number
  def datatable_page
    params[:start].to_i / datatable_per_page + 1
  end

  ## Returns Datatable Per Page Length Count
  def datatable_per_page
    params[:length].to_i > 0 ? params[:length].to_i : 10
  end

  ## Returns Datatable Sorting Direction
  def datatable_sort_direction
    params[:order]['0'][:dir] == 'desc' ? 'desc' : 'asc'
  end
end