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
            characteres = @document.xpath(PATH_XML_CHARACTERS).map { |node| node.children.text }
            hash_document = {}
            characteres.each do |name|
                hash_document[name] = 0 if name != CHARACTER_IGONE
            end

            hash_document.each do |key, value|
                nodes_speech = @document.xpath("//SPEAKER[text()='#{key}']")
                nodes_spoken_line = []
                nodes_speech.each do |node|
                    node_next = node.next_element
                    while(node_next != nil)
                        nodes_spoken_line << node_next
                        node_next = node_next.next_element
                    end
                end
                hash_document[key] = nodes_spoken_line.size
            end
            hash_document
        end
    end
    
end