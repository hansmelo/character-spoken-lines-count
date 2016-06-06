require 'open-uri'
require 'nokogiri'

module CharacterSpokenLinesCount
  class Document
    def get_xml
      Nokogiri::XML(open("http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml"))
    end
  end
end