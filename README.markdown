# Library for connecting to hostConnect

## Notes
* All variables passing in/out of hostConnect via XML are written in CapitalCamelCase.
  We, however, use snake_case for all parameters/attributes.
* Variables that are to be defined zero or more times, should be passed in as an array.
  For example ":opt => ['LONAC????????????', 'MAN??????????????']"
* For requests that return multiple results (i.e OptionInfo), we supply a size method to
  display the number of results.

## Dev docs
* hostConnect API doc: http://www.tourplan.com/support/Connector/hostConnect_2_04_170.html
* Xml-Simple: http://xml-simple.rubyforge.org/
* Builder: http://builder.rubyforge.org/
