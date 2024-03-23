//
//  ShowTV.swift
//  TvShow
//
//  Created by Nathan Mora on 20/03/24.
//

import Foundation

class TvShow: NSObject, Decodable, NSCoding {
   func encode(with aCoder: NSCoder) {
      print("Trying to transform Podcast into Data")
      aCoder.encode(id, forKey: "tvIdKey")
      aCoder.encode(name, forKey: "nameKey")
      //aCoder.encode(language ?? "", forKey: "languageKey")
      aCoder.encode(premiered, forKey: "premieredKey")
      /*aCoder.encode(officialSite, forKey: "officialSiteKey")
      aCoder.encode(network, forKey: "networkKey")*/
      aCoder.encode(image?.medium, forKey: "imageKey")

   }
   
   required init?(coder aDecoder: NSCoder) {
      self.id = aDecoder.decodeObject(forKey: "tvIdKey") as? Int
      self.name = aDecoder.decodeObject(forKey: "nameKey") as? String ?? ""
      self.language = aDecoder.decodeObject(forKey: "languageKey") as? Language
      self.premiered = aDecoder.decodeObject(forKey: "premieredKey") as? String
      self.officialSite = aDecoder.decodeObject(forKey: "officialSiteKey") as? String
      self.network = aDecoder.decodeObject(forKey: "networkKey") as? Network
      self.dvdCountry = aDecoder.decodeObject(forKey: "dvdCountryKey") as? Country
      self.image = aDecoder.decodeObject(forKey: "imageKey") as? Image
      self.summary = aDecoder.decodeObject(forKey: "summaryKey") as? String ?? ""
   }
   
   
   let id: Int?
   let name: String?
   let language: Language?
   let premiered: String?
   let officialSite: String?
   let network: Network?
   let dvdCountry: Country?
   let image: Image?
   let summary: String
   
   enum CodingKeys: String, CodingKey {
      case id, name, language, premiered, officialSite, network, dvdCountry, image, summary
   }
   
   // MARK: - Country -- Here
   struct Country: Decodable {
      let name: Name?
      let timezone: Timezone?
   }
   
   enum Name: String, Decodable {
      case canada = "Canada"
      case france = "France"
      case germany = "Germany"
      case japan = "Japan"
      case unitedKingdom = "United Kingdom"
      case unitedStates = "United States"
   }
   
   enum Timezone: String, Decodable {
      case americaHalifax = "America/Halifax"
      case americaNewYork = "America/New_York"
      case asiaTokyo = "Asia/Tokyo"
      case europeBusingen = "Europe/Busingen"
      case europeLondon = "Europe/London"
      case europeParis = "Europe/Paris"
   }
   
   // MARK: - Image
   struct Image: Decodable {
      var medium, original: String
   }
   
   enum Language: String, Decodable, Hashable {
      case english = "English"
      case japanese = "Japanese"
   }
   
   // MARK: - Network
   struct Network: Decodable {
      let id: Int
      let name: String
      let country: Country?
      let officialSite: String?
   }
 
   
  
   
}

