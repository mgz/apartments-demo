class FeedController < ApplicationController
  def index
    @unique_apartments = UniqueApartmentProvider.call
    
    respond_to do |format|
      format.html
      format.json {
        render json: Formatter::JSONFormatter.call(@unique_apartments)
      }
      format.text {
        render plain: Formatter::PlainTextFormatter.call(@unique_apartments)
      }
    end
  end
end
