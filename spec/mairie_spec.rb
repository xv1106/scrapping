require 'rspec'
require_relative '/Users/Xavier/Documents/THP/Week3_scrapping2/lib/mairie.rb' 

describe "mairie scrapping" do
  it "doesn't return an empty hash" do #basic test to check if my hash has been properly populated at least by 1 key,value pair
  test_variable_for_mairie_file = super_mairie_scrapping_method
    expect(test_variable_for_mairie_file.size).to be > 0 
  end

  it "contains data for specific cities" do
  test_variable_for_mairie_file = super_mairie_scrapping_method #Does the 3 key chosen value exists in the hash?
    expect(test_variable_for_mairie_file).to include("Mairie Aigues-Vives" => "mairie-aiguesvives@wanadoo.fr")
    expect(test_variable_for_mairie_file).to include("Mairie Airoux" => "mairieairoux@wanadoo.fr")
    expect(test_variable_for_mairie_file).to include("Mairie Ajac" => "mairie.ajac@wanadoo.fr")
  end

end
