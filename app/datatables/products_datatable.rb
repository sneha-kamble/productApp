class ProductsDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Product.count,
      # iTotalDisplayRecords: products.total_entries,
      aaData: data
    }
  end

private

  def data
    products.map do |w|
      [
        (link_to w.name),
        (link_to w.model),
        (link_to w.brand),
        (link_to w.year),
        (link_to w.ram),
        (link_to w.external_storage),
      ]
    end
  end

  def products
    @products ||= fetch_products
  end

  def fetch_products
    products = Product.all()
    products = products.order("#{sort_column} #{sort_direction}")
    products = products.page(page).per_page(per_page)
    if params[:sSearch].present?
      products = products.where("brand like :search or model like :search or ram like :search or external_storage like :search", search: "%#{params[:sSearch]}%")
    end
    products
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 25
  end

  def sort_column
    columns = %w[name brand ram external_storage]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
