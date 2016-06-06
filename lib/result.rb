require_relative 'document'
require_relative 'parse_document'

module CharacterSpokenLinesCount
  class Result
    
    def initialize(options)
      @options = options
    end
    
    def print
      document_xml = CharacterSpokenLinesCount::Document.new.get_xml
      hash_document = order(CharacterSpokenLinesCount::ParseDocument.new(document_xml).get_hash)
      hash_document.each do |key, value|
        puts "#{value} #{key}"
      end
    end

    private
    def order(hash_document)
      unless @options.nil?
        if @options[:parameter] == "character"
          if @options[:order] == "asc"
            hash_document = hash_document.sort_by {|key, value| key}.to_h
          elsif @options[:order] == "desc"
            hash_document = hash_document.sort_by {|key, value| key}.reverse.to_h
          end
        elsif @options[:parameter] == "count"
          if @options[:order] == "asc"
            hash_document = hash_document.sort_by {|key, value| value}.to_h
          elsif @options[:order] == "desc"
            hash_document = hash_document.sort_by {|key, value| value}.reverse.to_h
          end
        end
       end
      hash_document
    end
  end
end