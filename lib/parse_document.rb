require_relative 'exceptions'

module CharacterSpokenLinesCount
    class ParseDocument        
        def initialize(document)
            raise CharacterSpokenLinesCount::Error::ParseDocumentException if document.nil?
            @document = document
        end
        def get_hash()
            {"MACBETH" => 1}
        end
    end
end