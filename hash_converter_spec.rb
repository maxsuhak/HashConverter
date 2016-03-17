require 'rspec'
require 'rails'
require_relative 'hash_converter.rb'

describe HashConverter do

  context '#to_underscore' do
    let(:hash) { { "helloILikeThis" => { "recursesThrough" => [{"evenInto" => "arraysButNotVals"}]}} }
    let(:result) { {"hello_i_like_this"=>{"recurses_through"=>[{"even_into"=>"arraysButNotVals"}]}} }
    it 'shold convert hash to snake_case' do
      expect(HashConverter.to_underscore(hash)).to eq result
    end
  end

  context '#to_camel_case' do
    let(:hash) { {"hello_i_like_this"=>{"recurses_through"=>[{"even_into"=>"arraysButNotVals"}]}} }
    let(:result) { { "HelloILikeThis" => { "RecursesThrough" => [{"EvenInto" => "arraysButNotVals"}]}} }
    it 'shold convert hash to snake_case' do
      expect(HashConverter.to_camel_case(hash)).to eq result
    end
  end
end
