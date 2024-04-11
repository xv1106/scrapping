require 'nokogiri'
require 'open-uri'

def super_mairie_scrapping_method()
    # J'utilise Nokogiri pour parser le contenu HTML de la homepage decoinmarketcap
  doc = Nokogiri::HTML(URI.open("https://www.aude.fr/annuaire-mairies-du-departement"))
  
  # J'indique le xpath du module du site avec les infos qui m'interessent
  mairies_page = doc.xpath('//div[contains(@class, "directory-block")]')
  
  # Un petit hash vide pour stocker les noms et emails qu'on va aller chercher juste après
  mairies_hash = {}

  
  mairies_page.each do |info|   # Une boucle pour fetch et extract les éléments qui m'interessent dans
    city = info.xpath('.//h2').text.strip
    email = info.xpath('.//p[3]/a').text.strip
    unless mairies_hash.key?(city)  # Check si la ville est déjà dans mon hash
      mairies_hash[city] = email #stock les valeurs dans le hash
    end
  end

  return mairies_hash
end

mairies_hash = super_mairie_scrapping_method()

mairies_hash.each do |city, email|
  puts "#{city} --> #{email}"
end