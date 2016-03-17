require 'rspec'
require 'rails'
require_relative 'hash_converter.rb'

describe HashConverter do
  context '#to_underscore' do
    let(:hash) do
      [{"FreeSponsorId"   => "Test"},
      {"ProductCode"      => "ABC"},
      {"AssociateFirst"   => "Shri"},
      {"AssociateLast"    => "Shah"},
      {"AssociateNumber"  => "A8388392"},
      {"SaleSource"       => "telemarketing"}]
    end
    let(:result) do
      [{"free_sponsor_id" => "Test"},
      {"product_code"     => "ABC"},
      {"associate_first"  => "Shri"},
      {"associate_last"   => "Shah"},
      {"associate_number" => "A8388392"},
      {"sale_source"      => "telemarketing"}]
    end

    it 'shold convert hash to snake_case' do
      expect(HashConverter.to_underscore(hash)).to eq result
    end
  end

  context '#to_camel_case' do
    let(:hash) do
      [{"free_sponsor_id" => "Test"},
      {"product_code"     => "ABC"},
      {"associate_first"  => "Shri"},
      {"associate_last"   => "Shah"},
      {"associate_number" => "A8388392"},
      {"sale_source"      => "telemarketing"}]
    end
    let(:result) do
      [{"FreeSponsorId"   => "Test"},
      {"ProductCode"      => "ABC"},
      {"AssociateFirst"   => "Shri"},
      {"AssociateLast"    => "Shah"},
      {"AssociateNumber"  => "A8388392"},
      {"SaleSource"       => "telemarketing"}]
    end

    it 'shold convert hash to camel_case' do
      expect(HashConverter.to_camel_case(hash)).to eq result
    end
  end
end
