# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{hostconnect}
  s.version = "0.1.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Bj\303\270rn Arild M\303\246land"]
  s.date = %q{2008-12-02}
  s.description = %q{Library for interfacing with Tourplan's hostConnect software, which is a web service interface for tour booking.}
  s.email = %q{}
  s.extra_rdoc_files = ["README.markdown", "CHANGELOG", "lib/hostconnect.rb", "lib/hostconnect/builders/agent_info_builder.rb", "lib/hostconnect/builders/pax_details_builder.rb", "lib/hostconnect/builders/record_booking_payment_builder.rb", "lib/hostconnect/builders/add_service_builder.rb", "lib/hostconnect/builders/room_config_builder.rb", "lib/hostconnect/builders/get_booking_builder.rb", "lib/hostconnect/builders/get_services_builder.rb", "lib/hostconnect/builders/get_system_settings_builder.rb", "lib/hostconnect/builders/get_locations_builder.rb", "lib/hostconnect/builders/new_booking_info_builder.rb", "lib/hostconnect/builders/suppler_info_builder.rb", "lib/hostconnect/builders/list_bookings_builder.rb", "lib/hostconnect/builders/option_info_builder.rb", "lib/hostconnect/builders/get_booking_payment_summary_builder.rb", "lib/hostconnect/builders/service_line_note_builder.rb", "lib/hostconnect/builders/ping_builder.rb", "lib/hostconnect/coercion.rb", "lib/hostconnect/core_extensions/string.rb", "lib/hostconnect/core_extensions/symbol.rb", "lib/hostconnect/translation.rb", "lib/hostconnect/responses/agent_info.rb", "lib/hostconnect/responses/get_services.rb", "lib/hostconnect/responses/list_bookings.rb", "lib/hostconnect/responses/get_locations.rb", "lib/hostconnect/responses/get_booking.rb", "lib/hostconnect/responses/record_booking_payment.rb", "lib/hostconnect/responses/option_info.rb", "lib/hostconnect/responses/get_booking_payment_summary.rb", "lib/hostconnect/responses/add_service.rb", "lib/hostconnect/responses/supplier_info.rb", "lib/hostconnect/responses/get_system_settings.rb", "lib/hostconnect/responses/ping.rb", "lib/hostconnect/rtf_document.rb", "lib/hostconnect/builder.rb", "lib/hostconnect/client.rb", "lib/hostconnect/response.rb"]
  s.files = ["Rakefile", "README.markdown", "CHANGELOG", "hostconnect.gemspec", "lib/hostconnect.rb", "lib/hostconnect/builders/agent_info_builder.rb", "lib/hostconnect/builders/pax_details_builder.rb", "lib/hostconnect/builders/record_booking_payment_builder.rb", "lib/hostconnect/builders/add_service_builder.rb", "lib/hostconnect/builders/room_config_builder.rb", "lib/hostconnect/builders/get_booking_builder.rb", "lib/hostconnect/builders/get_services_builder.rb", "lib/hostconnect/builders/get_system_settings_builder.rb", "lib/hostconnect/builders/get_locations_builder.rb", "lib/hostconnect/builders/new_booking_info_builder.rb", "lib/hostconnect/builders/suppler_info_builder.rb", "lib/hostconnect/builders/list_bookings_builder.rb", "lib/hostconnect/builders/option_info_builder.rb", "lib/hostconnect/builders/get_booking_payment_summary_builder.rb", "lib/hostconnect/builders/service_line_note_builder.rb", "lib/hostconnect/builders/ping_builder.rb", "lib/hostconnect/coercion.rb", "lib/hostconnect/core_extensions/string.rb", "lib/hostconnect/core_extensions/symbol.rb", "lib/hostconnect/translation.rb", "lib/hostconnect/responses/agent_info.rb", "lib/hostconnect/responses/get_services.rb", "lib/hostconnect/responses/list_bookings.rb", "lib/hostconnect/responses/get_locations.rb", "lib/hostconnect/responses/get_booking.rb", "lib/hostconnect/responses/record_booking_payment.rb", "lib/hostconnect/responses/option_info.rb", "lib/hostconnect/responses/get_booking_payment_summary.rb", "lib/hostconnect/responses/add_service.rb", "lib/hostconnect/responses/supplier_info.rb", "lib/hostconnect/responses/get_system_settings.rb", "lib/hostconnect/responses/ping.rb", "lib/hostconnect/rtf_document.rb", "lib/hostconnect/builder.rb", "lib/hostconnect/client.rb", "lib/hostconnect/response.rb", "MIT-LICENSE", "spec/builders/new_booking_info_builder_spec.rb", "spec/builders/ping_builder_spec.rb", "spec/builders/get_locations_builder_spec.rb", "spec/builders/add_service_builder_spec.rb", "spec/builders/room_config_builder_spec.rb", "spec/builders/option_info_builder_spec.rb", "spec/builders/agent_info_builder_spec.rb", "spec/builders/pax_details_builder_spec.rb", "spec/spec_helper.rb", "spec/fixtures/requests/ping.xml", "spec/fixtures/requests/agent_info.xml", "spec/fixtures/requests/option_info/hotel_search_total_stay_price.xml", "spec/fixtures/requests/option_info/option_number.xml", "spec/fixtures/requests/option_info/hotel_search.xml", "spec/fixtures/requests/get_locations.xml", "spec/fixtures/requests/add_service_request/hotel_booking.xml", "spec/fixtures/responses/ping.xml", "spec/fixtures/responses/agent_info.xml", "spec/fixtures/responses/agent_info_error.xml", "spec/fixtures/responses/get_booking.xml", "spec/fixtures/responses/option_info/tours.xml", "spec/fixtures/responses/option_info/hotel_search_with_stay_price.xml", "spec/fixtures/responses/option_info/option_number.xml", "spec/fixtures/responses/option_info/hotel_price.xml", "spec/fixtures/responses/option_info/hotel_search.xml", "spec/fixtures/responses/get_system_settings.xml", "spec/fixtures/responses/add_service.xml", "spec/fixtures/responses/get_locations.xml", "spec/client_spec.rb", "spec/core_extensions_spec.rb", "spec/responses/get_booking_spec.rb", "spec/responses/get_system_settings_spec.rb", "spec/responses/agent_info_spec.rb", "spec/responses/option_info_spec.rb", "spec/responses/add_service_spec.rb", "spec/responses/ping_spec.rb", "spec/responses/get_locations_spec.rb", "spec/translation_spec.rb", "spec/coercion_spec.rb", "Manifest"]
  s.has_rdoc = true
  s.homepage = %q{http://www.github.com/Chrononaut/hostconnect/}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Hostconnect", "--main", "README.markdown"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{hostconnect}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Library for interfacing with Tourplan's hostConnect software, which is a web service interface for tour booking.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 0"])
      s.add_runtime_dependency(%q<hpricot>, [">= 0"])
      s.add_runtime_dependency(%q<builder>, [">= 0"])
      s.add_runtime_dependency(%q<rtf>, [">= 0"])
      s.add_development_dependency(%q<echoe>, [">= 0"])
    else
      s.add_dependency(%q<activesupport>, [">= 0"])
      s.add_dependency(%q<hpricot>, [">= 0"])
      s.add_dependency(%q<builder>, [">= 0"])
      s.add_dependency(%q<rtf>, [">= 0"])
      s.add_dependency(%q<echoe>, [">= 0"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 0"])
    s.add_dependency(%q<hpricot>, [">= 0"])
    s.add_dependency(%q<builder>, [">= 0"])
    s.add_dependency(%q<rtf>, [">= 0"])
    s.add_dependency(%q<echoe>, [">= 0"])
  end
end
