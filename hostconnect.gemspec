--- !ruby/object:Gem::Specification 
name: hostconnect
version: !ruby/object:Gem::Version 
  version: 0.1.0
platform: ruby
authors: 
- "Bj\xC3\xB8rn Arild M\xC3\xA6land"
autorequire: 
bindir: bin

date: 2008-08-11 00:00:00 +02:00
default_executable: 
dependencies: 
- !ruby/object:Gem::Dependency 
  name: activesupport
  type: :runtime
  version_requirement: 
  version_requirements: !ruby/object:Gem::Requirement 
    requirements: 
    - - ">="
      - !ruby/object:Gem::Version 
        version: "0"
    version: 
- !ruby/object:Gem::Dependency 
  name: hpricot
  type: :runtime
  version_requirement: 
  version_requirements: !ruby/object:Gem::Requirement 
    requirements: 
    - - ">="
      - !ruby/object:Gem::Version 
        version: "0"
    version: 
- !ruby/object:Gem::Dependency 
  name: builder
  type: :runtime
  version_requirement: 
  version_requirements: !ruby/object:Gem::Requirement 
    requirements: 
    - - ">="
      - !ruby/object:Gem::Version 
        version: "0"
    version: 
- !ruby/object:Gem::Dependency 
  name: echoe
  type: :development
  version_requirement: 
  version_requirements: !ruby/object:Gem::Requirement 
    requirements: 
    - - ">="
      - !ruby/object:Gem::Version 
        version: "0"
    version: 
description: Library for interfacing with Tourplan's hostConnect software, which is a web service interface for tour booking.
email: ""
executables: []

extensions: []

extra_rdoc_files: 
- README.markdown
- CHANGELOG
- lib/hostconnect.rb
- lib/hostconnect/builders/agent_info_builder.rb
- lib/hostconnect/builders/pax_details_builder.rb
- lib/hostconnect/builders/add_service_builder.rb
- lib/hostconnect/builders/room_config_builder.rb
- lib/hostconnect/builders/get_booking_builder.rb
- lib/hostconnect/builders/get_services_builder.rb
- lib/hostconnect/builders/get_system_settings_builder.rb
- lib/hostconnect/builders/get_locations_builder.rb
- lib/hostconnect/builders/new_booking_info_builder.rb
- lib/hostconnect/builders/suppler_info_builder.rb
- lib/hostconnect/builders/list_bookings_builder.rb
- lib/hostconnect/builders/option_info_builder.rb
- lib/hostconnect/builders/ping_builder.rb
- lib/hostconnect/coercion.rb
- lib/hostconnect/core_extensions/string.rb
- lib/hostconnect/core_extensions/symbol.rb
- lib/hostconnect/responses/agent_info.rb
- lib/hostconnect/responses/get_services.rb
- lib/hostconnect/responses/list_bookings.rb
- lib/hostconnect/responses/get_locations.rb
- lib/hostconnect/responses/get_booking.rb
- lib/hostconnect/responses/option_info.rb
- lib/hostconnect/responses/add_service.rb
- lib/hostconnect/responses/supplier_info.rb
- lib/hostconnect/responses/get_system_settings.rb
- lib/hostconnect/responses/ping.rb
- lib/hostconnect/builder.rb
- lib/hostconnect/client.rb
- lib/hostconnect/response.rb
files: 
- Rakefile
- README.markdown
- CHANGELOG
- hostconnect.gemspec
- lib/hostconnect.rb
- lib/hostconnect/builders/agent_info_builder.rb
- lib/hostconnect/builders/pax_details_builder.rb
- lib/hostconnect/builders/add_service_builder.rb
- lib/hostconnect/builders/room_config_builder.rb
- lib/hostconnect/builders/get_booking_builder.rb
- lib/hostconnect/builders/get_services_builder.rb
- lib/hostconnect/builders/get_system_settings_builder.rb
- lib/hostconnect/builders/get_locations_builder.rb
- lib/hostconnect/builders/new_booking_info_builder.rb
- lib/hostconnect/builders/suppler_info_builder.rb
- lib/hostconnect/builders/list_bookings_builder.rb
- lib/hostconnect/builders/option_info_builder.rb
- lib/hostconnect/builders/ping_builder.rb
- lib/hostconnect/coercion.rb
- lib/hostconnect/core_extensions/string.rb
- lib/hostconnect/core_extensions/symbol.rb
- lib/hostconnect/responses/agent_info.rb
- lib/hostconnect/responses/get_services.rb
- lib/hostconnect/responses/list_bookings.rb
- lib/hostconnect/responses/get_locations.rb
- lib/hostconnect/responses/get_booking.rb
- lib/hostconnect/responses/option_info.rb
- lib/hostconnect/responses/add_service.rb
- lib/hostconnect/responses/supplier_info.rb
- lib/hostconnect/responses/get_system_settings.rb
- lib/hostconnect/responses/ping.rb
- lib/hostconnect/builder.rb
- lib/hostconnect/client.rb
- lib/hostconnect/response.rb
- MIT-LICENSE
- spec/builders/new_booking_info_builder_spec.rb
- spec/builders/ping_builder_spec.rb
- spec/builders/get_locations_builder_spec.rb
- spec/builders/add_service_builder_spec.rb
- spec/builders/room_config_builder_spec.rb
- spec/builders/option_info_builder_spec.rb
- spec/builders/agent_info_builder_spec.rb
- spec/builders/pax_details_builder_spec.rb
- spec/spec_helper.rb
- spec/fixtures/requests/ping.xml
- spec/fixtures/requests/agent_info.xml
- spec/fixtures/requests/option_info/hotel_search_total_stay_price.xml
- spec/fixtures/requests/option_info/option_number.xml
- spec/fixtures/requests/option_info/hotel_search.xml
- spec/fixtures/requests/get_locations.xml
- spec/fixtures/requests/add_service_request/hotel_booking.xml
- spec/fixtures/responses/ping.xml
- spec/fixtures/responses/agent_info.xml
- spec/fixtures/responses/agent_info_error.xml
- spec/fixtures/responses/get_booking.xml
- spec/fixtures/responses/option_info/tours.xml
- spec/fixtures/responses/option_info/hotel_search_with_stay_price.xml
- spec/fixtures/responses/option_info/option_number.xml
- spec/fixtures/responses/option_info/hotel_price.xml
- spec/fixtures/responses/option_info/hotel_search.xml
- spec/fixtures/responses/get_system_settings.xml
- spec/fixtures/responses/add_service.xml
- spec/fixtures/responses/get_locations.xml
- spec/client_spec.rb
- spec/core_extensions_spec.rb
- spec/responses/get_booking_spec.rb
- spec/responses/get_system_settings_spec.rb
- spec/responses/agent_info_spec.rb
- spec/responses/option_info_spec.rb
- spec/responses/add_service_spec.rb
- spec/responses/ping_spec.rb
- spec/responses/get_locations_spec.rb
- spec/coercion_spec.rb
- Manifest
has_rdoc: true
homepage: http://www.github.com/Chrononaut/hostconnect/
post_install_message: 
rdoc_options: 
- --line-numbers
- --inline-source
- --title
- Hostconnect
- --main
- README.markdown
require_paths: 
- lib
required_ruby_version: !ruby/object:Gem::Requirement 
  requirements: 
  - - ">="
    - !ruby/object:Gem::Version 
      version: "0"
  version: 
required_rubygems_version: !ruby/object:Gem::Requirement 
  requirements: 
  - - "="
    - !ruby/object:Gem::Version 
      version: "1.2"
  version: 
requirements: []

rubyforge_project: hostconnect
rubygems_version: 1.2.0.1845
specification_version: 2
summary: Library for interfacing with Tourplan's hostConnect software, which is a web service interface for tour booking.
test_files: []
