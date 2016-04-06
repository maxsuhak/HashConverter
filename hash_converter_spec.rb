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

    it 'should convert keys to snake_case' do
      expect(HashConverter.to_underscore(hash)).to eq(result)
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

    it 'should convert keys to camel_case' do
      expect(HashConverter.to_camel_case(hash)).to eq(result)
    end
  end

  context '#keys_to_string' do
    let(:hash) do
      [{free_sponsor_id:      "Test"},
      {product_code:          "ABC"},
      {associate_first:       "Shri"},
      {associate_last:        "Shah"},
      {associate_number:      "A8388392"},
      {sale_source:           "telemarketing"}]
    end
    let(:result) do
      [{"free_sponsor_id"  => "Test"},
      {"product_code"      => "ABC"},
      {"associate_first"   => "Shri"},
      {"associate_last"    => "Shah"},
      {"associate_number"  => "A8388392"},
      {"sale_source"       => "telemarketing"}]
    end

    it 'should convert keys to string' do
      expect(HashConverter.keys_to_string(hash)).to eq(result)
    end
  end

  context '#keys_to_symbol' do
    let(:hash) do
      [{"free_sponsor_id"  => "Test"},
      {"product_code"      => "ABC"},
      {"associate_first"   => "Shri"},
      {"associate_last"    => "Shah"},
      {"associate_number"  => "A8388392"},
      {"sale_source"       => "telemarketing"}]
    end
    let(:result) do
      [{free_sponsor_id:      "Test"},
      {product_code:          "ABC"},
      {associate_first:       "Shri"},
      {associate_last:        "Shah"},
      {associate_number:      "A8388392"},
      {sale_source:           "telemarketing"}]
    end

    it 'should convert keys to symbol' do
      expect(HashConverter.keys_to_symbol(hash)).to eq(result)
    end
  end

  context '#to_float' do
    let(:hash) do
      [{
        "Zip"                  => "94303",
        "City"                 => "PALO ALTO",
        "StateID"              => "CA",
        "County"               => "SANTA CLARA",
        "CityAliasMixedCase"   => "East Palo Alto",
        "FederalUSFPercent"    => BigDecimal("7.1762"),
        "StateUSFPercent"      => BigDecimal("7.1762"),
        "State911"             => BigDecimal("7.1762"),
        "StateUtilityPercent"  => BigDecimal("7.1762"),
        "StateOther"           => BigDecimal("7.1762"),
        "County911"            => BigDecimal("7.1762"),
        "CountyUtilityPercent" => BigDecimal("7.1762"),
        "CountyUtility"        => BigDecimal("7.1762"),
        "CountyOther"          => BigDecimal("7.1762"),
        "City911"              => BigDecimal("7.1762"),
        "CityUtilityPercent"   => BigDecimal("7.1762"),
        "CityOther"            => BigDecimal("7.1762"),
        "RegComplianceFee"     => BigDecimal("7.1762")
      }]
    end
    let(:result) do
      [{
        "Zip"                  => "94303",
        "City"                 => "PALO ALTO",
        "StateID"              => "CA",
        "County"               => "SANTA CLARA",
        "CityAliasMixedCase"   => "East Palo Alto",
        "FederalUSFPercent"    => 7.1762,
        "StateUSFPercent"      => 7.1762,
        "State911"             => 7.1762,
        "StateUtilityPercent"  => 7.1762,
        "StateOther"           => 7.1762,
        "County911"            => 7.1762,
        "CountyUtilityPercent" => 7.1762,
        "CountyUtility"        => 7.1762,
        "CountyOther"          => 7.1762,
        "City911"              => 7.1762,
        "CityUtilityPercent"   => 7.1762,
        "CityOther"            => 7.1762,
        "RegComplianceFee"     => 7.1762
      }]
    end

    it 'should convert hash values to float if BigDecimal' do
      expect(HashConverter.to_float(hash)).to eq result
    end
  end
end
