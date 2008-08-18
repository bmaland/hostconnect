module HostConnect
  # For setting up simple RTF Documents
  class RtfDocument
    def initialize(paragraphs)
      @document = RTF::Document.new(RTF::Font.new(RTF::Font::ROMAN, 'Times New Roman'))
      paragraphs.each do |p|
        @document.paragraph << p
      end
    end

    def to_rtf
      @document.to_rtf
    end

    def to_s
      @document.to_s
    end
  end
end
