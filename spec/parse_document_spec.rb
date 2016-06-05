require 'minitest/spec'
require 'minitest/autorun'
require 'nokogiri' 
require_relative '../lib/parse_document'
describe CharacterSpokenLinesCount::ParseDocument do
    before do
        @document = Nokogiri::XML(open('macbeth.xml')) 
    end
    
    describe "#parse" do
        it "must returned hash" do
            parse_document = CharacterSpokenLinesCount::ParseDocument.new
            hash_character_count = parse_document.get_hash(@document)
            hash_character_count.wont_be_nil
        end
    end
end