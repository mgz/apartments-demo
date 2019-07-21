class FeedController < ApplicationController
  def index
    apartments = ExternalService::ApartmentsService.call
    agencies = ExternalService::AgenciesService.call
    
    @unique_apartments = ApartmentFilter.call(apartments: apartments, agencies: agencies)
    
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
