class LinksController < ApplicationController
  def show
    link = Link.find(params[:id])
    @url = redirect_url(link)
  end

  def create
    link = Link.new(link_params)
    prepend_http_if_no_scheme_given(link)
    link.save

    redirect_to link
  end

  def link_params
    params.require(:link).permit(:url)
  end

  def prepend_http_if_no_scheme_given(link)
    if link.missing_scheme?
      link.url = "http://" + link.url
    end
  end
end
