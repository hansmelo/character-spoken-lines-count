require_relative 'document'
require_relative 'parse_document'

module CharacterSpokenLinesCount
    class Result
        def print
            document_xml = CharacterSpokenLinesCount::Document.new.get_xml
            hash_document = CharacterSpokenLinesCount::ParseDocument.new(document_xml).get_hash
            hash_document.each do |key, value|
                puts "#{value} #{key}"
            end
        end
    end
end