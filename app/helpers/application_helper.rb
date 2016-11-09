module ApplicationHelper

  def breadcrumb_tag(&block)
    render 'application/breadcrumb' , block: capture(&block)
  end


end
