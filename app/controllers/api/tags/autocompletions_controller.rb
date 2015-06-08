class Api::Tags::AutocompletionsController < ApplicationController

  def index
    @fragment = params[:term]
    @tags = Tag.where("title LIKE ?", "#{@fragment}%")
    @titles = @tags.map(&:title)
    render json: @titles
  end

end