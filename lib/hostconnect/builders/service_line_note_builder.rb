module HostConnect
  class ServiceLineNoteBuilder < AbstractBuilder
    def initialize(options = {})
      @valid_options = [ :note_category, :note_text ].freeze
      super(options)
    end

    def to_xml
      x = Builder::XmlMarkup.new(:indent => 2, :margin => 3)
      x.ServiceLineNote {
        x.NoteCategory @note_category
        x.NoteText @note_text
      }
      x
    end
  end
end
