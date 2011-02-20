# Library for connecting to hostConnect

HostConnect is used for connecting the TourPlan (ICOM) back end software with a front end software, usually a website.

## Notes
* All variables passing in/out of hostConnect via XML are written in CapitalCamelCase.
  We, however, use snake_case for all parameters/attributes.
* Variables that are to be defined zero or more times, should be passed in as an array.
  For example ":opt => ['LONAC????????????', 'MAN??????????????']"
* For requests that return multiple results (i.e OptionInfo), we supply a size method to
  display the number of results.

## Dev docs
* hostConnect API doc: http://www.tourplan.com/support/Connector/
* Test page for hostConnect XML interface: http://demo.tourplan.com/TAS_AA/conntest.html
* Builder: http://builder.rubyforge.org/

## License
Copyright (c) 2007-2010 Bjørn Arild Mæland. See MIT-LICENSE for details.
