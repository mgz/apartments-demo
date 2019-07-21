class UniqueApartmentProvider
  def self.call
    apartments = ExternalService::ApartmentsService.call
    agencies = ExternalService::AgenciesService.call
    ApartmentFilter.call(apartments: apartments, agencies: agencies)
  end
end