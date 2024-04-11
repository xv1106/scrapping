require 'rspec'
require_relative '/Users/Xavier/Documents/THP/Week3_scrapping2/lib/dark_trader.rb'

describe "crypto price" do
  it "doesn't return an empty hash" do #basic test to check if my hash has been properly populated at least by 1 key,value pair
    test_variable_for_dark_trader_file = super_crypto_scrapping_method
    expect(test_variable_for_dark_trader_file.size).to be > 0
  end

  it "contains data for my crypto" do
    test_variable_for_dark_trader_file = super_crypto_scrapping_method #Does the 3 key chosen value exists in the hash?
    expect(test_variable_for_dark_trader_file).to include("BTCBitcoin")
    expect(test_variable_for_dark_trader_file).to include("ETHEthereum")
    expect(test_variable_for_dark_trader_file).to include("USDTTether USDt")
  end
end