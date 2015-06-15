class TemplatesController < ApplicationController
  def serve
    render "templates/#{params[:name]}", layout: nil
  end
end
