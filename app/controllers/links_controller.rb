class LinksController < ApplicationController
  def show
    link = Link.find(params[:id])
    @url = URI.join(host_with_port, link.id.to_s)
  end

  def create
    link = Link.new(link_params)
    link.save

    redirect_to link
  end

  def link_params
    params.require(:link).permit(:url)
  end

  def host_with_port
    "http://#{request.host_with_port}"
  end
end
