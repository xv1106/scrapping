require 'nokogiri'
require 'open-uri'

def super_crypto_scrapping_method
  # J'utilise Nokogiri pour parser le contenu HTML de la homepage decoinmarketcap
  doc = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))

  # J'indique le xpath de mon tableau de crypto
  crypto_tab = doc.xpath('//tr[contains(@class, "cmc-table-row")]')

  # Un petit hash vide pour stocker les noms et prix qu'on va aller chercher juste après
  crypto_hash = {}

  # Une boucle pour fetch et extract les éléments qui m'interessent dans mon tableau de crypto
  crypto_tab.each do |row|
    name = row.xpath('.//td[2]').text.strip #2eme colonne de mon tab
    price = row.xpath('.//td[5]').text.strip # 5ème colonne de mon tab
    #.strip pour enlever les espaces inutiles contenu dans les colonnes
    
    crypto_hash[name] = price unless price.empty? #on stock uniquement les crypto qui ont un prix associé
  end

  return crypto_hash
end

crypto_hash = super_crypto_scrapping_method

crypto_hash.each do |name, price| # Et on sort ça en tableau pour que ça soit plus clean
  puts "#{name} => #{price}"
end