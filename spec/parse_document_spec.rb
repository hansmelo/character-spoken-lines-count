require 'minitest/spec'
require 'minitest/autorun'
require 'nokogiri' 
require_relative '../lib/parse_document'
require_relative '../lib/exceptions'

describe CharacterSpokenLinesCount::ParseDocument do
    before do
        @document = Nokogiri::XML(open('macbeth.xml')) 
    end
    
    describe "#parse" do
        it "must returned hash" do
            parse_document = CharacterSpokenLinesCount::ParseDocument.new(@document)
            hash_character_count = parse_document.get_hash()
            hash_character_count.wont_be_nil
        end
        it "should raise ParseDocumentException if not initialized object" do
            proc{
              CharacterSpokenLinesCount::ParseDocument.new(nil)
            }.must_raise CharacterSpokenLinesCount::Error::ParseDocumentException
        end
        it "must returned the count of key" do
            parse_document = CharacterSpokenLinesCount::ParseDocument.new(@document)
            hash_character_count = parse_document.get_hash()
            hash_character_count["Doctor"].must_equal 2
        end
        
    end
end