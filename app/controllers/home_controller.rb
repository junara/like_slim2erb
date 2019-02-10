require "slim/erb_converter"

class HomeController < ActionController::Base
  def index
    @slim_text = params[:slim] && params[:slim][:text]
    @erb_text = @slim_text ? Slim::ERBConverter.new.call(@slim_text) : nil
  end
end
