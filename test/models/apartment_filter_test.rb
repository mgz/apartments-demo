require 'test_helper'

class ApartmentsFilterTest < ActiveSupport::TestCase
  
  test 'Do not filter distinct apartments' do
    ap_1 = Apartment.new(
      address: 1,
      apartment: 1,
      city: 1,
      price: 1,
      rental_agency: 1
    )

    ap_2 = Apartment.new(
      address: 2,
      apartment: 1,
      city: 1,
      price: 1,
      rental_agency: 1
    )
    
    agency = Agency.new(1, priority: 1)
    
    assert_equal 2, ApartmentFilter.call(apartments: [ap_1, ap_2], agencies: [agency]).size
  end

  test 'Filter duplicate apartments' do
    ap_1 = Apartment.new(
      address: 1,
      apartment: 1,
      city: 1,
      price: 1,
      rental_agency: 1
    )
  
    ap_2 = Apartment.new(
      address: 1,
      apartment: 1,
      city: 1,
      price: 1,
      rental_agency: 1
    )
  
    agency = Agency.new(1, priority: 1)
  
    assert_equal 1, ApartmentFilter.call(apartments: [ap_1, ap_2], agencies: [agency]).size
  end

  test 'Filter duplicate apartments in correct order' do
    ap_1 = Apartment.new(
      address: 1,
      apartment: 1,
      city: 1,
      price: 1,
      rental_agency: 1
    )
  
    ap_2 = Apartment.new(
      address: 1,
      apartment: 1,
      city: 1,
      price: 1,
      rental_agency: 2
    )

    ap_3 = Apartment.new(
      address: 1,
      apartment: 1,
      city: 1,
      price: 1,
      rental_agency: 3
    )
  
    agency_1 = Agency.new(1, priority: 1)
    agency_2 = Agency.new(2, priority: 3)
    agency_3 = Agency.new(3, priority: 2)
  
    assert_equal ap_2, ApartmentFilter.call(
      apartments: [ap_1, ap_2, ap_3],
      agencies: [agency_1, agency_2, agency_3]).first
  end
end