//
//  APIService.swift
//  TvShow
//
//  Created by Nathan Mora on 20/03/24.
//

import UIKit

class APIService {
   
   static let shared = APIService()
   
   func fetchDataShowsTV(completion: @escaping([TvShow]?, Error?) -> ()) {
      let urlString = "https://api.tvmaze.com/shows"
      fetchDataGeneric(urlString: urlString, completion: completion)
   }

   
   func fetchDataGeneric<T: Decodable>(urlString: String, completion: @escaping(T?, Error?) ->()) {
      guard let url = URL(string: urlString) else { return }
      
      var request = URLRequest(url: url)
      
      //request.setValue("0b7e6ef1cb0f427b725840048b514534", forHTTPHeaderField: "x-rapidapi-key")
      
      URLSession.shared.dataTask(with: request) { (data, response, error) in
         guard let data, error == nil else {
            completion(nil, error)
            return
         }
         do {
            let objects = try JSONDecoder().decode(T.self, from: data)
            completion(objects, nil)
         } catch {
            print("decoding error:", error)
            completion(nil, error)
         }
         
      }.resume()
   }
}
