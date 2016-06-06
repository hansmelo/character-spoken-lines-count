require_relative 'exceptions'

module CharacterSpokenLinesCount
  class ParseDocument 
    PATH_XML_CHARACTERS = "//SPEECH/SPEAKER"
    CHARACTER_IGONE = "ALL"
    
    def initialize(document)
      raise CharacterSpokenLinesCount::Error::ParseDocumentException if document.nil?
      @document = document
    end

    def get_hash()
      array_characteres = get_array_characteres
      get_hash_characteres_count(array_characteres)
    end

    private
    def get_array_characteres
      @document.xpath(PATH_XML_CHARACTERS).map { |node| node.children.text }.select{|character| character != CHARACTER_IGONE}
    end

    def get_hash_characteres_count(array_characteres)
      hash_document = {}
      array_characteres.each do |character|
        hash_document[character] = count_lines_spoken(character)
      end
      hash_document
    end

    def count_lines_spoken(character)
      nodes_speech = get_nodes_speech(character)
      nodes_spoken_line = []
      nodes_speech.each do |node|
        node_next = node.next_element
        until(node_next.nil?)
          nodes_spoken_line << node_next
          node_next = node_next.next_element
        end
      end
      nodes_spoken_line.size
    end

    def get_nodes_speech(character)
      @document.xpath("//SPEAKER[text()='#{character}']")
    end 
  end

end